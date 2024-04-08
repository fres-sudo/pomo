import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.controller, this.focusNode});

  final TextEditingController controller;
  final FocusNode? focusNode;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      obscureText: obscureText,
      controller: widget.controller,
      cursorColor: kPrimary600,
      autovalidateMode:
      AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          hintText: "Password",
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: obscureText
                ? const Icon(
              Icons.visibility_outlined,
            )
                : const Icon(
                Icons.visibility_off_outlined),
          )),
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp('[ ]')),
      ],
      style: Theme.of(context).textTheme.titleMedium,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            value.length < 7) {
          return 'Please enter a valid password';
        }
        return null;
      },
    );
  }
}
