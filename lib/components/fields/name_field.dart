import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomo/components/utils/utils.dart';

import '../../constants/colors.dart';

class NameField extends StatelessWidget {
  const NameField({super.key, required this.controller, required this.hintText, this.onChanged, this.focusNode});

  final TextEditingController controller;
  final String hintText;
  final Function(String?)? onChanged;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      autovalidateMode:
      AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText.capitalize(),
      ),
      onChanged: onChanged,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp('[ ]')),
      ],
      style: Theme.of(context).textTheme.titleMedium,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            value.length < 3) {
          return 'Please enter a valid $hintText';
        }
        return null;
      },
    );
  }
}
