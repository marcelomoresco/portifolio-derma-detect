// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_system/src/core/colors/icolor.dart';
import 'package:design_system/src/core/extensions/context_theme_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DermaButton extends StatelessWidget {
  const DermaButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textColor,
    this.isEnable = true,
    this.isLoading = false,
  });
  final void Function()? onPressed;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isEnable;
  final bool isLoading;

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
      onPressed: isEnable
          ? () {
              FocusScope.of(context).unfocus();
              if (onPressed != null) {
                onPressed!();
              }
            }
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                    color: textColor ?? iColors.fgDefault,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ],
      ),
    );
  }
}
