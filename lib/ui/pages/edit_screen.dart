import 'package:flutter/material.dart';
import 'package:flutter_projects_view/ui/widgets/custom_form.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                CustomForm()
              ],
            ))),
      ),
    );
  }
}
