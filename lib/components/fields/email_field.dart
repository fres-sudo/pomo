import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key, required this.controller, this.focusNode});

  final TextEditingController controller;
  final FocusNode? focusNode;

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      autovalidateMode:
      AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        hintText: "Email",
      ),
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp('[ ]')),
      ],
      style: Theme.of(context).textTheme.titleMedium,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            !EmailValidator.validate(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }
}
