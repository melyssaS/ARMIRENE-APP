import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: size.width * 0.75,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none),
                    hintText: "Search ...",
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              IconButton(
                icon: Icon(Icons.filter_list_outlined),
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("Filters",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                            CheckboxListTile(
                                value: true,
                                onChanged: (bool? value) {},
                                title: const Text("Nombre")),
                            CheckboxListTile(
                                value: true,
                                onChanged: (bool? value) {},
                                title: const Text("Primer Apellido")),
                            CheckboxListTile(
                                value: true,
                                onChanged: (bool? value) {},
                                title: const Text("Segundo Apellido")),
                            CheckboxListTile(
                                value: true,
                                onChanged: (bool? value) {},
                                title: const Text("Tipo de identificacion")),
                            CheckboxListTile(
                                value: true,
                                onChanged: (bool? value) {},
                                title: const Text("Numero de identificacion")),
                            CheckboxListTile(
                                value: true,
                                onChanged: (bool? value) {},
                                title: const Text("Pais del Empleo")),
                            CheckboxListTile(
                                value: true,
                                onChanged: (bool? value) {},
                                title: const Text("Correo electronico")),
                            CheckboxListTile(
                                value: true,
                                onChanged: (bool? value) {},
                                title: const Text("Estado")),
                          ],
                        );
                      });
                },
              ),
            ],
          )),
    );
    ;
  }
}
