import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../providers/fields/password_provider.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, required this.controller});

  @override
  PasswordFieldState createState() => PasswordFieldState();

  final TextEditingController controller;
}

class PasswordFieldState extends State<PasswordField> {
  bool _showPassword = false;

  String? _validatePassword(String? value) {
    final passwordValidProvider = Provider.of<PasswordValidProvider>(context, listen: false);
    value = value?.trim();

    if (value == null || value.length < 8) {
      passwordValidProvider.updatePasswordIsValid(false);
      return null;
    }
    passwordValidProvider.updatePasswordIsValid(true);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PasswordValidProvider>(builder: (context, passwordValidProvider, child) {
      final isValid = passwordValidProvider.getPasswordIsValid();
      return TextFormField(
        controller: widget.controller,
        cursorColor: kPrimary600,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp('[ ]')),
        ],
        obscureText: !_showPassword,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (String? value){
          if(isValid != null){
            return !isValid ? 'The password is not valid' : null;
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: "Password",
          fillColor:  context.isDarkMode ? kNeutral900: kNeutral100,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
            child:Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _showPassword ? const Icon(Icons.visibility_outlined,) : const Icon(Icons.visibility_off_outlined),
              ],
            ),
          ),
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
        ),
        style: Theme.of(context).textTheme.titleMedium,
        onChanged: (value) {
          _validatePassword(value);
        },
      );
    });
  }
}
