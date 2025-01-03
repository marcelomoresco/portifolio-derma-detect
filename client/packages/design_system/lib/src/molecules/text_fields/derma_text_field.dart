import 'package:design_system/src/core/extensions/context_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum BorderType { none, underline, outline }

class DermaTextField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final String? initialValue;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onPressedSuffix;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final VoidCallback? onTap;
  final bool readOnly;

  const DermaTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.initialValue,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressedSuffix,
    this.onChanged,
    this.controller,
    this.validator,
    this.onSaved,
    this.obscureText = false,
    this.onTap,
    this.readOnly = false,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 6),
        TextFormField(
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          onTap: onTap,
          readOnly: readOnly,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: initialValue,
          cursorColor: context.colors.background,
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          onSaved: onSaved,
          obscureText: obscureText,
          autofocus: false,
          decoration: InputDecoration(
            // contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            border: InputBorder.none,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.colors.danger!,
              ),
            ),
            errorStyle: TextStyle(
              color: context.colors.danger,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: context.colors.primary!,
              ),
            ),
            filled: true,
            fillColor: const Color(0xFFF4F5F4),
            hintText: hintText,
            labelStyle: TextStyle(
              color: context.colors.secodary,
            ),
            prefixIcon: getPrefixIcon(),
            suffixIcon: getSuffixIcon(),
          ),
        ),
      ],
    );
  }

  Widget? getPrefixIcon() {
    if (prefixIcon == null) {
      return null;
    }
    return Icon(prefixIcon);
  }

  Widget? getSuffixIcon() {
    if (suffixIcon == null) {
      return null;
    }
    return IconButton(
      icon: Icon(
        suffixIcon,
        color: Colors.black,
      ),
      onPressed: onPressedSuffix,
    );
  }
}
