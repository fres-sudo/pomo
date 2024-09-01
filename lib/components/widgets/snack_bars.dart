import 'package:flutter/material.dart';
import 'package:pomo/components/widgets/invalid_input_dialog.dart';
import 'package:pomo/constants/colors.dart';

import '../../i18n/strings.g.dart';

onInvalidInput(BuildContext context, {bool isAlert = false}){
  WidgetsBinding.instance.addPostFrameCallback((_) {
    !isAlert
        ? ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
           backgroundColor: kYellow100,
           shape: OutlineInputBorder(
               borderRadius: BorderRadius.circular(12),
               borderSide: const BorderSide(color: kYellow200)
           ),
          duration: const Duration(seconds: 2),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Text('${t.errors.valid_info}📝',)),
    )
        : showDialog(context: context, builder: (BuildContext context)  => const InvalidInputDialog());
  });
}

onAcceptTermsCondition(BuildContext context){
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
          duration:  Duration(seconds: 2),
          padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Text('You have to accept Terms & Conditions to create an account 📍',)),
    );
  });
}

onEmailSent(BuildContext context){
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
          duration:  Duration(seconds: 3),
          padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Text('Your email has been sent 📩, please check your inbox or your SPAM 📬️',)),
    );
  });
}

onDoesntMatch(BuildContext context){
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
          duration:  Duration(seconds: 2),
          padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Text('The password aren\'t the same ❌',)),
    );
  });
}

onOTPInvalid(BuildContext context){
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
          duration:  Duration(seconds: 2),
          padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Text('The OTP you insert may not valid or expired ❌',)),
    );
  });
}

onErrorState(BuildContext context, String text) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: kRed100,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: kRed200)
          ),
          duration: const Duration(seconds: 3),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Text('$text🚨')),
    );
  });
}
onSuccessState(BuildContext context, String text,) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: const Duration(seconds: 2),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Text(
              'Great! ✅ You successfully $text')),
    );
  });
}


onAvailableSoon(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: kYellow100,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: kYellow200)
          ),
          duration: const Duration(seconds: 2),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: const Text(
              'Sorry! 😣 This feature will be available soon 👀')),
    );
  });
}

onFirstProfileSeen(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          duration:  Duration(seconds: 3),
          padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Text(
              'If you want you can update your name and surname up here! ℹ️')));
  });
}