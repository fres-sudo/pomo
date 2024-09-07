import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pomo/components/widgets/dotted_divider.dart';
import 'package:pomo/constants/styles.dart';
import 'package:pomo/components/widgets/custom_floating_button.dart';
import 'package:pomo/pages/projects/widget/task_bottom_sheet.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../components/widgets/profile_picture.dart';
import '../../constants/text.dart';
import '../../extension/sized_box_extension.dart';
import '../../i18n/strings.g.dart';
import '../../routes/app_router.gr.dart';

@RoutePage()
class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  late final ValueNotifier<List<Event>> _selectedEvents;

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  List<Event> _getEventsForDay(DateTime day) {
    return List.generate(
      10,
      (index) => Event(date: DateTime.now().add(Duration(days: index)), label: "Task $index + ${day.day}"),
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  void initState() {
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
    super.initState();
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: CustomFloatingActionButton(onPressed: () {
          showModalBottomSheet(
              context: context,
              useRootNavigator: true,
              isScrollControlled: true,
              builder: (context) => TaskBottomSheet(
                    dueDate: _selectedDay,
                  ));
        }),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Schedule", style: kSerzif(context)),
                    InkWell(onTap: () => context.router.push(const ProfileNavigation()), child: const ProfilePicture()),
                  ],
                ),
                TableCalendar(
                    focusedDay: _focusedDay,
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(const Duration(days: 365)),
                    onDaySelected: _onDaySelected,
                    calendarFormat: _calendarFormat,
                    onFormatChanged: (format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    },
                    locale: TranslationProvider.of(context).flutterLocale.languageCode,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                    rangeSelectionMode: RangeSelectionMode.disabled,
                    calendarStyle: kCalendarStyle(context)),
                Gap.SM,
                const DottedDivider(),
                Gap.SM,
                Expanded(
                  child: ValueListenableBuilder<List<Event>>(
                    valueListenable: _selectedEvents,
                    builder: (context, value, _) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 4.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: ListTile(
                              tileColor: Theme.of(context).colorScheme.secondary,
                              onTap: () => print('${value[index]}'),
                              title: Text(
                                value[index].label,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class Event {
  final DateTime date;
  final String label;

  Event({required this.date, required this.label});
}
