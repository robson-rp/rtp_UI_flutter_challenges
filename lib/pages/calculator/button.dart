import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {Key? key,
      required this.buttonText,
      required this.textColor,
      required this.buttonTapped,
      required this.isDark})
      : super(key: key);
  final Color textColor;
  final String buttonText;
  final Function() buttonTapped;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: isDark ? Colors.grey[850] : Colors.grey[300],
              shape: BoxShape.circle,
              boxShadow: [
                //Bottom shadow
                BoxShadow(
                    color: isDark ? Colors.grey[900]! : Colors.grey.shade400,
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                    spreadRadius: 2),
                //top shadow
                BoxShadow(
                    color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                    offset: const Offset(-2, -2),
                    blurRadius: 4,
                    spreadRadius: 2)
              ]),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
