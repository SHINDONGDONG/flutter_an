import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({this.color, this.title, @required this.onPressed});

  final Color color;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: color ?? Colors.red,
        child: MaterialButton(
          onPressed: onPressed,
          child: Text(title),
          minWidth: 200,
          height: 40,
        ),
      ),
    );
  }
}
