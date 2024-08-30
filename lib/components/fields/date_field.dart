import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../i18n/strings.g.dart';

class DateField extends StatelessWidget {
  const DateField(
      {super.key, required this.selectedDate, required this.onPress, required this.onDelete, this.hintText, this.firstDate, this.lastDate, });

  final DateTime? selectedDate;
  final Function(DateTime) onPress;
  final VoidCallback onDelete;
  final String? hintText;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary
              ),
              onPressed: () async {
                final date = await showDatePicker(
                    context: context,
                    confirmText: "Ok",
                    initialDate: DateTime.now(),
                    currentDate: DateTime.now(),
                    firstDate: firstDate ?? DateTime.now(),
                    lastDate: lastDate ??  DateTime.now().add(const Duration(days: 365 * 100))) ?? DateTime.now();
                onPress(date);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    selectedDate != null ?
                    DateFormat.yMMMMd(Localizations.localeOf(context).toString()).format(selectedDate!)
                        : hintText ?? t.general.select_date,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: selectedDate != null ? Theme.of(context).colorScheme.onSecondary: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
              )),
        ),
        if (selectedDate != null)
          IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.clear_rounded, color: Theme.of(context).colorScheme.onSecondary,))
      ],
    );
  }
}

