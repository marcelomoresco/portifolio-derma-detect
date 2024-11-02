import 'package:design_system/src/core/colors/icolor.dart';
import 'package:design_system/src/core/extensions/context_theme_extension.dart';
import 'package:flutter/material.dart';

class DermaButton extends StatelessWidget {
  const DermaButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
  });
  final void Function()? onPressed;
  final String text;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final IColors iColors = context.colors;

    return MaterialButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      minWidth: 353,
      height: 50,
      color: backgroundColor ?? iColors.secodary,
      disabledColor: Colors.grey,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: iColors.fgDefault,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
