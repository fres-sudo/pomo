import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/colors.dart';
import '../../i18n/strings.g.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key, required this.controller, this.focusNode, this.onChanged});

  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String?)? onChanged;



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
      decoration: const InputDecoration(
        hintText: "Email",
      ),
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp('[ ]')),
      ],
      onChanged: widget.onChanged,
      style: Theme.of(context).textTheme.titleMedium,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            !EmailValidator.validate(value)) {
          return t.errors.form.valid_email;
        }
        return null;
      },
    );
  }
}
