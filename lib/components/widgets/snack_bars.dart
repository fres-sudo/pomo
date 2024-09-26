import 'package:flutter/material.dart';
import 'package:pomo/components/widgets/invalid_input_dialog.dart';
import 'package:pomo/constants/colors.dart';
import 'package:provider/provider.dart';

import '../../cubits/theme/theme_cubit.dart';
import '../../i18n/strings.g.dart';

bool _isSnackBarVisible = false;

onInvalidInput(BuildContext context, {bool isAlert = false, String? text}) {
  if (!_isSnackBarVisible) {
    _isSnackBarVisible = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      !isAlert
          ? ScaffoldMessenger.of(context)
              .showSnackBar(
                SnackBar(
                    backgroundColor: Provider.of<ThemeCubit>(context, listen: false).state.mode == ThemeMode.dark ? kYellow800 : kYellow200,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: Provider.of<ThemeCubit>(context, listen: false).state.mode == ThemeMode.dark ? kYellow500 : kYellow400)),
                    duration: const Duration(seconds: 5),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    content: Text(
                      '${text ?? t.errors.valid_info}📝',
                    )),
              )
              .closed
              .then((_) {
              _isSnackBarVisible = false;
            })
          : showDialog(context: context, builder: (BuildContext context) => InvalidInputDialog(text: text)).then((_) => _isSnackBarVisible = false);
    });
  }
}

onErrorState(BuildContext context, String text) {
  if (!_isSnackBarVisible) {
    _isSnackBarVisible = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
                backgroundColor: Provider.of<ThemeCubit>(context, listen: false).state.mode == ThemeMode.dark ? kRed800 : kRed200,
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: kRed500)),
                duration: const Duration(seconds: 5),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                content: Text('$text🚨')),
          )
          .closed
          .then((_) {
        _isSnackBarVisible = false;
      });
    });
  }
}

onSuccessState(
  BuildContext context,
  String text,
) {
  if (!_isSnackBarVisible) {
    _isSnackBarVisible = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: const Duration(seconds: 5), padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20), content: Text('✅ $text')),
      ).closed
          .then((_) {
        _isSnackBarVisible = false;
      });
    });
  }
}

onAvailableSoon(BuildContext context) {
  print(_isSnackBarVisible);
  if (!_isSnackBarVisible) {
    _isSnackBarVisible = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
                backgroundColor: Provider.of<ThemeCubit>(context, listen: false).state.mode == ThemeMode.dark ? kYellow800 : kYellow200,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Provider.of<ThemeCubit>(context, listen: false).state.mode == ThemeMode.dark ? kYellow500 : kYellow400)),
                duration: const Duration(seconds: 5),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                content: Text('${t.errors.sorry} 😣${t.errors.available_soon} 👀')),
          )
          .closed
          .then((_) {
        _isSnackBarVisible = false;
      });
    });
  }
}

onAcceptTermsCondition(BuildContext context) {
  if (!_isSnackBarVisible) {
    _isSnackBarVisible = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
                backgroundColor: Provider.of<ThemeCubit>(context, listen: false).state.mode == ThemeMode.dark ? kYellow800 : kYellow200,
                duration: const Duration(seconds: 5),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Provider.of<ThemeCubit>(context, listen: false).state.mode == ThemeMode.dark ? kYellow500 : kYellow400)),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                content: Text(t.errors.accept_terms_and_condition)),
          )
          .closed
          .then((_) {
        _isSnackBarVisible = false;
      });
    });
  }
}

onDoesNotMatch(BuildContext context) {
  if (!_isSnackBarVisible) {
    _isSnackBarVisible = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
                backgroundColor: Provider.of<ThemeCubit>(context, listen: false).state.mode == ThemeMode.dark ? kYellow800 : kYellow200,
                duration: const Duration(seconds: 5),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide:
                        BorderSide(color: Provider.of<ThemeCubit>(context, listen: false).state.mode == ThemeMode.dark ? kYellow500 : kYellow400)),
                content: Text(t.errors.forgot_password.reset_password_not_match_error)),
          )
          .closed
          .then((_) {
        _isSnackBarVisible = false;
      });
    });
  }
}

onFirstProfileSeen(BuildContext context) {
  if (!_isSnackBarVisible) {
    _isSnackBarVisible = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(
              duration: Duration(seconds: 5),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              content: Text('If you want you can update your name and surname up here! ℹ️')))
          .closed
          .then((_) {
        _isSnackBarVisible = false;
      });
    });
  }
}
