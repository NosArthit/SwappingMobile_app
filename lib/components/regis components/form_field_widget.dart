import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class FormFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool isObscure;
  final Function(String?) onSaved;
  final FieldValidator validator;
  final int? minLines;
  final int? maxLines;

  const FormFieldWidget({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.isObscure = false,
    required this.onSaved,
    required this.validator,
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
        ),
        obscureText: isObscure,
        onSaved: onSaved,
        validator: validator,
        minLines: minLines,
        maxLines: maxLines,
      ),
    );
  }
}


