import 'package:flutter/material.dart';

class LogInFormTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hintText;
  final bool obscureText; 
  final Function(String?) onSaved;
  final String? Function(String?) validator;

  const LogInFormTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.onSaved, 
    required this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
        ),
        onSaved: (text) => onSaved(text),
        validator: (text) => validator(text),
      ),
    );
  }
}
