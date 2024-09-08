import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        padding: const EdgeInsets.only(top: 26, left: 16, bottom: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).bottomSheetTheme.backgroundColor
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.info_outline_rounded,size: 20,),
                Gap.SM_H,
                Text('Task Information',
                    style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            Gap.SM,
            const Divider(),
            Gap.SM,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Name:", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: kNeutral500),),
                Text(task.name, style: Theme.of(context).textTheme.titleMedium,)
            ],),
            Gap.SM,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Description:", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: kNeutral500),),
                Expanded(
                    child: Text(task.description ?? "No description", style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.end, maxLines: 2, overflow: TextOverflow.ellipsis,))
            ],),
            Gap.SM,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pomodoro:", style: Theme.of(context).textTheme.titleMedium?.copyWith(color:kNeutral500),),
                Text(task.pomodoro.toString(), style: Theme.of(context).textTheme.titleMedium,)
              ],),
            Gap.SM,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Pomodoro completed:", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: kNeutral500),),
                Text(task.pomodoroCompleted.toString(), style: Theme.of(context).textTheme.titleMedium,)
              ],),
            Gap.SM,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Created At:", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: kNeutral500),),
                Text(DateFormat('MMM dd, yyyy', TranslationProvider.of(context).flutterLocale.languageCode).format(task.createdAt), style: Theme.of(context).textTheme.titleMedium,)
            ],),
            Gap.SM,
            task.pomodoro == task.pomodoroCompleted  ?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Completed At:", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: kNeutral500),),
                Text(DateFormat('MMM dd, yyyy', TranslationProvider.of(context).flutterLocale.languageCode).format(task.completedAt!), style: Theme.of(context).textTheme.titleMedium,)
            ],) : const SizedBox(),
            Gap.SM,
      
          ],
        )
      ),
    );
  }
}
