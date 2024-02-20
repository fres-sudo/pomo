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

class NameField extends StatefulWidget {

  const NameField({super.key, required this.controller, this.text});

  @override
  NameFieldState createState() => NameFieldState();

  final TextEditingController controller;
  final String? text;

}

class NameFieldState extends State<NameField> {

  String? _validateName(String? value) {
    final nameValidProvider = Provider.of<NameValidProvider>(context, listen: false);
    //value = value?.trim();

    if (value == null || !nameRegex.hasMatch(value)) {
      nameValidProvider.updateNameIsValid(false);
      return null;
    }
    nameValidProvider.updateNameIsValid(true);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NameValidProvider>(
        builder: (context, nameValidProvider, child) {
          final isValid = nameValidProvider.getNameIsValid();
          return TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: widget.controller,
            cursorColor: kPrimary600,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp('[ ]')),
            ],
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            validator: (String? value){
              if(isValid != null){
                return !isValid ? 'The username is not valid' : null;
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: widget.text ?? "Username",
              fillColor: context.isDarkMode ? kNeutral900: kNeutral100,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kRed500, width: 1),
                borderRadius: BorderRadius.circular(12.0),
              ),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none
              ),
              filled: true,
              contentPadding: const EdgeInsets.only(bottom: 17, top: 17, left: 16),
              // Error text will be set based on email validation result
            ),
            style: kSubtitle2(context),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: (value) {
              _validateName(value);
            },
          );
        }

    );
  }
}