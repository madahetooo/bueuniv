import 'package:flutter/material.dart';

class FilledOutlinedButton extends StatelessWidget {
  const FilledOutlinedButton({
    Key? key,
    this.isFilled = true,
    required this.press,
    required this.text,
  }) : super(key: key);

  final bool isFilled;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.white),
      ),
      elevation: isFilled ? 8 : 0,
      color: isFilled ? Colors.white : Colors.transparent,
      child: Text(
        text,
        style: TextStyle(
          color: isFilled ? Colors.blue : Colors.white,
          fontSize: 12
        ),
      ),
    );
  }
}
