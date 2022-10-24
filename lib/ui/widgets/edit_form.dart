import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_projects_view/controllers/user_controller.dart';
import 'package:flutter_projects_view/ui/pages/home_screen.dart';
import 'package:flutter_projects_view/ui/widgets/datepicker_box.dart';
import 'package:get/get.dart';
import "./input_box.dart";
import './input_dropdown.dart';

class EditForm extends StatefulWidget {
  UserController userController = Get.find<UserController>();
  final Map<String, TextEditingController> controllers;

  EditForm({super.key, required this.controllers});
  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputBox(
            textLabel: "Primer Apellido",
            maxlength: 20,
            controller: widget.controllers["lastName"],
            filter: "fullNameRegExp",
          ),
          InputBox(
            textLabel: "Segundo Apellido",
            maxlength: 20,
            controller: widget.controllers["secondLastName"],
            filter: "fullNameRegExp",
          ),
          InputBox(
            textLabel: "Primer Nombre",
            maxlength: 20,
            controller: widget.controllers["firstName"],
            filter: "fullNameRegExp",
          ),
          InputBox(
              textLabel: "Otro Nombre",
              maxlength: 50,
              controller: widget.controllers["secondName"],
              filter: "fullNameRegExp",
              isOptional: true),
          InputDropdown(
            textLabel: "Pais",
            items: const ["Colombia", "Estados Unidos"],
            controller: widget.controllers["country"],
          ),
          InputDropdown(
              textLabel: "Tipo de Identificacion",
              items: const [
                "C.C",
                "Cedula Extranjera",
                "Pasaporte",
                "Permiso Especial"
              ],
              controller: widget.controllers["idType"]),
          InputBox(
            textLabel: "Identificacion",
            maxlength: 20,
            controller: widget.controllers["idNumber"],
            filter: "idRegExp",
          ),
          DatePickerBox(controller: widget.controllers["firstDay"]),
          InputDropdown(
              textLabel: "Area",
              items: const [
                "Administración",
                "Financiera",
                "Compras",
                "Infraestructura",
                "Operación",
                "Talento Humano",
                "Servicios Varios",
              ],
              controller: widget.controllers["area"]),
          InputBox(
              textLabel: "Estado",
              isEnabled: false,
              controller: widget.controllers["status"]),
          InputBox(
            textLabel: "Fecha y hora de registro",
            value: formatDate(DateTime.now(),
                [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn, ':', ss]),
            isEnabled: false,
            controller: widget.controllers["registerDate"],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      textStyle: const TextStyle(
                          letterSpacing: 2,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans')),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final map = <String, dynamic>{'email': "@"};
                      widget.controllers.forEach((key, value) {
                        map.addAll({key: value.text});
                      });
                      await widget.userController.updateUser(map);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  },
                  child: const Text("Editar",
                      style: TextStyle(color: Colors.white, fontSize: 17))))
        ],
      ),
    );
  }
}
