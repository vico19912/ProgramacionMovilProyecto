import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String validatorMsg;
  final TextInputType keyboardType;
  final bool isNumber;
  final int? maxLines;

  const CustomTextFormField({
<<<<<<< HEAD
    super.key,
=======
    Key? key,
>>>>>>> e3846cc6db5ab1270407338ec69e0b87c4114f63
    required this.label,
    required this.controller,
    required this.validatorMsg,
    this.keyboardType = TextInputType.text,
    this.isNumber = false,
    this.maxLines,
<<<<<<< HEAD
  });
=======
  }) : super(key: key);
>>>>>>> e3846cc6db5ab1270407338ec69e0b87c4114f63

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
