import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/colors.dart';
import 'package:provider/provider.dart';
import '../../constants/constants.dart';
import '../../providers/fields/email_provider.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key, required this.controller});

  @override
  EmailFieldState createState() => EmailFieldState();

  final TextEditingController controller;
}

class EmailFieldState extends State<EmailField> {

  @override
  Widget build(BuildContext context) {
    return Consumer<EmailValidProvider>(
      builder: (context, emailValidProvider, child) {
        final isValid = emailValidProvider.getEmailIsValid();
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
              return !isValid ? 'The email is not valid' : null;
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: "Email",
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
          style: Theme.of(context).textTheme.titleMedium,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (value) {
            _validateEmail(value);
          },
        );
      },
    );
  }

  String? _validateEmail(String? value) {
    value = value?.trim();
    final emailValidProvider = Provider.of<EmailValidProvider>(context, listen: false);

    if (value == null || !emailRegex.hasMatch(value)) {
      emailValidProvider.updateEmailIsValid(false);
      return null;
    }

    emailValidProvider.updateEmailIsValid(true);
    return null;
  }
}




