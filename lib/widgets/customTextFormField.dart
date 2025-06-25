import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String validatorMsg;
  final TextInputType keyboardType;
  final bool isNumber;
  final int? maxLines;

  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.controller,
    required this.validatorMsg,
    this.keyboardType = TextInputType.text,
    this.isNumber = false,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorMsg;
        }
        if (isNumber && int.tryParse(value) == null) {
          return 'Ingresa un número válido';
        }
        return null;
      },
    );
  }
}