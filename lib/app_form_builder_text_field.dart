import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppFormBuilderTextField extends StatelessWidget {
  const AppFormBuilderTextField({
    Key? key,
    required this.name,
    this.labelText,
    required this.validator,
    this.hintText,
    this.maxLines,
    this.width,
    this.obscureText,
    this.keyboardType,
    this.labelColor,
    this.cursorColor,
    this.borderCOlor,
    this.suffixIcon,
    this.prefixIcon,
    this.enabled = true,
  }) : super(key: key);

  final String name;
  final int? maxLines;
  final double? width;
  final bool? enabled, obscureText;
  final String? hintText, labelText;
  final Widget? suffixIcon, prefixIcon;
  final TextInputType? keyboardType;
  final Color? labelColor, borderCOlor, cursorColor;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: width ?? 200,
      child: FormBuilderTextField(
        name: name,
        maxLines: maxLines ?? 1,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText ?? false,
        cursorColor: cursorColor ?? Colors.black,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          floatingLabelStyle: TextStyle(color: labelColor ?? Colors.black),
          enabled: enabled!,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              color: borderCOlor ?? Colors.black,
            ),
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
