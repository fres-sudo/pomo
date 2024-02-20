import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../constants/text.dart';
import '../../providers/fields/name_provider.dart';

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
      cursorColor: kPrimary600,
      validator: widget.validator,
      maxLines: widget.rows,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        prefixIconColor: context.isDarkMode ? kNeutral100 : kNeutral900,
        hintText: widget.hintText,
        fillColor: context.isDarkMode ? kNeutral900: kNeutral100,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kRed500, width: 1),
          borderRadius: BorderRadius.circular(12.0),
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none),
        filled: true,
        //contentPadding: const EdgeInsets.only(bottom: 17, top: 17, left: 16),
        contentPadding: const EdgeInsets.only(bottom: 48 / 2, left: 16, top: 12),
        // Error text will be set based on email validation result
      ),
      style: kSubtitle2(context),
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
