import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_projects_view/ui/widgets/edit_form.dart';
import 'package:flutter_projects_view/ui/pages/home_screen.dart';
import 'package:flutter_projects_view/controllers/user_controller.dart';

class EditScreen extends StatelessWidget {
  EditScreen({super.key, required this.user});
  UserController userController = Get.find<UserController>();
  final Map<String, dynamic> user;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }),
        body: SizedBox(
            width: size.width,
            height: size.height - 80,
            child: SingleChildScrollView(
                child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const Text("Editar Usuario",
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans')),
                EditForm(
                  controllers: getControllers(),
                )
              ],
            ))),
      ),
    );
  }

  Map<String, TextEditingController> getControllers() {
    final map = <String, TextEditingController>{};
    user.forEach((key, value) {
      map.addAll({key: TextEditingController(text: "$value")});
    });
    return map;
  }
}
