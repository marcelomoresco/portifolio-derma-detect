// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DermaOutlineButton extends StatelessWidget {
  const DermaOutlineButton({
    super.key,
    required this.onTap,
    required this.text,
    this.style,
    this.background,
  });
  final VoidCallback onTap;
  final String text;
  final TextStyle? style;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: context.colors.background!),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(double.infinity, 10),
      ),
      child: Text(
        text,
        style: style ??
            TextStyle(
              fontSize: 18,
              color: context.colors.background,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
