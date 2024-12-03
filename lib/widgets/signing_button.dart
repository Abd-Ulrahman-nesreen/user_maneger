import 'package:flutter/material.dart';

class SigningButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const SigningButton({
    super.key,
    required this.width,
    required this.theme, required this.text, required this.onPressed,
  });

  final double width;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: theme.primaryColor,
      child: SizedBox(
        width: width * 0.6,
        child: Text(text , textAlign: TextAlign.center, style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
        ),),
      ),
    );
  }
}