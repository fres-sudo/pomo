import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomo/components/utils/utils.dart';

import '../../constants/colors.dart';

class NameField extends StatefulWidget {
  const NameField({super.key, required this.controller, required this.text});

  final TextEditingController controller;
  final String text;

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode:
      AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.text.capitalize(),
      ),
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp('[ ]')),
      ],
      style: Theme.of(context).textTheme.titleMedium,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            value.length < 3) {
          return 'Please enter a valid ${widget.text}';
        }
        return null;
      },
    );
  }
}
