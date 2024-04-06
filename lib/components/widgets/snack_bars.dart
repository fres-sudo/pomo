import 'package:flutter/material.dart';

onInvalidInput(BuildContext context){
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
          duration:  Duration(seconds: 2),
          padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Text('Please enter valid information 📝',)),
    );
  });
}

onErrorState(BuildContext context, String text) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: const Duration(seconds: 2),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Text('Something went wrong while $text, please try again 🚨')),
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
      const SnackBar(
          duration:  Duration(seconds: 2),
          padding:  EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          content: Text(
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