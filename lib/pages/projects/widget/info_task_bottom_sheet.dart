import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pomo/components/widgets/top_bottom_sheet_widget.dart';
import 'package:pomo/constants/colors.dart';

import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';
import '../../../models/task/task.dart';

class InfoTaskBottomSheet extends StatelessWidget {
  const InfoTaskBottomSheet({super.key, required this.task});

  final Task task;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(color: Colors.black12, spreadRadius: 1000, blurRadius: 100),
          ],
          color: Theme
              .of(context)
              .bottomSheetTheme
              .backgroundColor,
        ),
        padding: const EdgeInsets.only(left: 16, bottom: 36, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TopBottomSheetWidget(),
            Gap.MD,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.info_outline_rounded,size: 20,),
                Gap.SM_H,
                Text(t.tasks.task_info,
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            Gap.SM,
            const Divider(),
            Gap.SM,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${t.general.name}:", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                Text(task.name, style: Theme.of(context).textTheme.titleMedium,)
            ],),
            Gap.SM,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${t.general.description}:", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                Expanded(
                    child: Text(task.description != null && task.description!.isNotEmpty ? task.description! : t.general.no_description, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.end, maxLines: 2, overflow: TextOverflow.ellipsis,))
            ],),
            Gap.SM,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${t.tasks.create.pomodoros}:", style: Theme.of(context).textTheme.titleMedium?.copyWith(color:Theme.of(context).colorScheme.onSecondary),),
                Text(task.pomodoro.toString(), style: Theme.of(context).textTheme.titleMedium,)
              ],),
            Gap.SM,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${t.general.pomodoro_done}:", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                Text(task.pomodoroCompleted.toString(), style: Theme.of(context).textTheme.titleMedium,)
              ],),
            Gap.SM,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${t.general.created_at}:", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                Text(DateFormat('MMM dd, yyyy', TranslationProvider.of(context).flutterLocale.languageCode).format(task.createdAt), style: Theme.of(context).textTheme.titleMedium,)
            ],),
            Gap.SM,
            if(task.pomodoro == task.pomodoroCompleted)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${t.general.completed_at}:", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),),
                Text(DateFormat('MMM dd, yyyy', TranslationProvider.of(context).flutterLocale.languageCode).format(task.completedAt!), style: Theme.of(context).textTheme.titleMedium,)
            ],),
            Gap.SM,

          ],
        )
      ),
    );
  }
}
