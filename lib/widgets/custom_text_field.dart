import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.onChanged,
    this.label,
    this.maxLines,
    this.maxLength,
    this.controller,
    this.keyboardType,
    this.obcureText = false,
  });
  ValueChanged<String> onChanged;
  String? label;
  TextEditingController? controller;
  int? maxLength;
  int? maxLines;
  TextInputType? keyboardType;
  bool obcureText = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      obscureText: obcureText,
      // keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        focusColor: Theme.of(context).colorScheme.primary,
        labelText: label,
      ),
    );
  }
}
