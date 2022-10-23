import 'package:flutter/material.dart';

class InputDropdown extends StatelessWidget {
  const InputDropdown(
      {super.key,
      required this.textLabel,
      required this.items,
      this.dropdownvalue,
      this.controller});

  final String textLabel;
  final String? dropdownvalue;
  final List<String> items;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.8,
        child: DropdownButtonFormField(
          validator: (value) {
            if (value == null) {
              return 'Debes seleccionar una opcion';
            }
            return null;
          },
          value: dropdownvalue,
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          style: const TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.bold,
              color: Colors.black),
          decoration: InputDecoration(
            labelText: textLabel,
            labelStyle: const TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black),
          ),
          onChanged: (String? newValue) {
            if (controller != null) {
              controller!.text = '$newValue';
            }
          },
        ));
  }
}
