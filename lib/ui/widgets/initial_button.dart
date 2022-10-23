import 'package:flutter/material.dart';

class InitialButton extends StatelessWidget {
  const InitialButton({
    super.key,
    required this.title,
    required this.colorBackground,
    required this.colorText,
  });

  final String title;
  final Color colorBackground;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: size.width * 0.8,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: colorBackground,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: const TextStyle(
                    letterSpacing: 2,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans')),
            onPressed: () {},
            child:
                Text(title, style: TextStyle(color: colorText, fontSize: 17))));
  }
}
