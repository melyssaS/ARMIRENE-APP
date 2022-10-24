import 'package:flutter/material.dart';
import 'package:flutter_projects_view/ui/widgets/initial_button.dart';
import 'package:flutter_projects_view/ui/pages/home_screen.dart';
import 'package:flutter_projects_view/ui/widgets/custom_form.dart';
import '../widgets/input_box.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

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
                Text("Agregar Usuario",
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans')),
                CustomForm()
              ],
            ))),
      ),
    );
  }
}
