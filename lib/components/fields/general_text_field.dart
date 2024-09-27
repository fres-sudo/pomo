import 'package:flutter/material.dart';

class GeneralField extends StatefulWidget {
  GeneralField(
      {super.key, required this.controller,this.validator, this.hintText, this.prefixIcon, this.prefixIconColor, this.rows});

  @override
  GeneralFieldState createState() => GeneralFieldState();

  final TextEditingController controller;
  final String? Function(String?)? validator;
  String? hintText;
  Widget? prefixIcon;
  Color? prefixIconColor;
  int? rows;
}

class GeneralFieldState extends State<GeneralField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      maxLines: widget.rows,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        hintText: widget.hintText,
      ),
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
