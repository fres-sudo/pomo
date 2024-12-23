import 'package:flutter/material.dart';

import '../../i18n/strings.g.dart';

enum AlertType { normal, warning, success, error }

class CustomAlert extends StatelessWidget {
  final AlertType type;
  final String title;
  final String message;
  final IconData? icon;
  final VoidCallback? onClose;

  const CustomAlert._({
    Key? key,
    required this.type,
    required this.title,
    required this.message,
    this.icon,
    this.onClose,
  }) : super(key: key);

  /// Named constructor for a normal alert
  factory CustomAlert.normal({
    required String title,
    required String message,
    IconData? icon,
    VoidCallback? onClose,
  }) {
    return CustomAlert._(
      type: AlertType.normal,
      title: title,
      message: message,
      icon: icon,
      onClose: onClose,
    );
  }

  /// Named constructor for a success alert
  factory CustomAlert.success({
    String? title,
    required String message,
    IconData? icon,
    VoidCallback? onClose,
  }) {
    return CustomAlert._(
      type: AlertType.success,
      title: title ?? t.general.success,
      message: message,
      icon: icon,
      onClose: onClose,
    );
  }

  /// Named constructor for a warning alert
  factory CustomAlert.warning({
    String? title,
    required String message,
    IconData? icon,
    VoidCallback? onClose,
  }) {
    return CustomAlert._(
      type: AlertType.warning,
      title: title ?? t.general.warning,
      message: message,
      icon: icon,
      onClose: onClose,
    );
  }

  /// Named constructor for an error alert
  factory CustomAlert.error({
    String? title,
    required String message,
    IconData? icon,
    VoidCallback? onClose,
  }) {
    return CustomAlert._(
      type: AlertType.error,
      title: title ?? t.errors.error,
      message: message,
      icon: icon,
      onClose: onClose,
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    final theme = Theme.of(context);
    switch (type) {
      case AlertType.warning:
        return theme.colorScheme.error.withOpacity(0.1);
      case AlertType.success:
        return Colors.green.withOpacity(0.1);
      case AlertType.error:
        return theme.colorScheme.error.withOpacity(0.1);
      case AlertType.normal:
      default:
        return theme.colorScheme.surface.withOpacity(0.1);
    }
  }

  Color _getTextColor(BuildContext context) {
    final theme = Theme.of(context);
    switch (type) {
      case AlertType.warning:
        return theme.colorScheme.error;
      case AlertType.success:
        return Colors.green;
      case AlertType.error:
        return theme.colorScheme.error;
      case AlertType.normal:
      default:
        return theme.colorScheme.onSurface;
    }
  }

  IconData _getDefaultIcon() {
    switch (type) {
      case AlertType.warning:
        return Icons.warning_amber_rounded;
      case AlertType.success:
        return Icons.check_circle_outline_rounded;
      case AlertType.error:
        return Icons.error_outline_rounded;
      case AlertType.normal:
      default:
        return Icons.info_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textColor = _getTextColor(context);
    final backgroundColor = _getBackgroundColor(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: textColor, width: 0.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon ?? _getDefaultIcon(),
            color: textColor,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  )
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: textColor,
                  )
                ),
              ],
            ),
          ),
          if (onClose != null)
            IconButton(
              icon: Icon(Icons.close, color: textColor),
              onPressed: onClose,
            ),
        ],
      ),
    );
  }
}
