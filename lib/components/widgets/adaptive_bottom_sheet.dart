import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<T?> showAdaptiveBottomSheet<T>(
    {required BuildContext context,
    required Widget Function(BuildContext context) builder,
    bool? isScrollController,
    bool useRootNavigator = true}) async {
  return Platform.isIOS
      ? await showCupertinoSheet<T>(
          context: context,
          builder: builder,
        )
      : await showModalBottomSheet<T>(
          context: context,
          isScrollControlled: isScrollController ?? false,
          useRootNavigator: useRootNavigator,
          builder: builder);
}
