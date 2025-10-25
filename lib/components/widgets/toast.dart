import 'package:flutter/material.dart';
import 'package:pomo/constants/device.dart';
import 'package:pomo/extension/extensions.dart';
import 'package:toastification/toastification.dart';

abstract class Toast {
  static void error(BuildContext context, String message, {String? title}) =>
      toastification.show(
        context: context,
        type: ToastificationType.error,
        style: ToastificationStyle.flat,
        title: Text(title?.hardcoded() ?? "Error".hardcoded(),
            style: Theme.of(context).textTheme.bodyMedium),
        padding: const EdgeInsets.all(Sizes.md),
        description: Text(message),
        alignment: Alignment.topCenter,
        autoCloseDuration: const Duration(seconds: 4),
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: highModeShadow,
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          width: 1.0,
        ),
      );

  static void success(String message, {String? title}) => toastification.show(
        type: ToastificationType.success,
        style: ToastificationStyle.flat,
        title: Text(title?.hardcoded() ?? "Success".hardcoded()),
        description: Text(message),
        alignment: Alignment.topCenter,
        autoCloseDuration: const Duration(seconds: 4),
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: highModeShadow,
        applyBlurEffect: true,
      );

  static void info(String message, {String? title}) => toastification.show(
        type: ToastificationType.info,
        style: ToastificationStyle.flat,
        title: Text(title?.hardcoded() ?? "Info".hardcoded()),
        description: Text(message),
        alignment: Alignment.topCenter,
        autoCloseDuration: const Duration(seconds: 4),
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: highModeShadow,
        applyBlurEffect: true,
      );

  static void warning(String message, {String? title}) => toastification.show(
        type: ToastificationType.warning,
        style: ToastificationStyle.flat,
        title: Text(title?.hardcoded() ?? "Warning".hardcoded()),
        description: Text(message),
        alignment: Alignment.topCenter,
        autoCloseDuration: const Duration(seconds: 4),
        borderRadius: BorderRadius.circular(100.0),
        boxShadow: highModeShadow,
        applyBlurEffect: true,
      );
}
