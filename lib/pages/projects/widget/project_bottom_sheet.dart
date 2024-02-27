import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/text.dart';

class ProjectBottomSheet extends StatelessWidget {
  const ProjectBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 3.5,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(
              color: Colors.black12, spreadRadius: 1000, blurRadius: 100),
        ],
        color: Theme.of(context).bottomSheetTheme
            .backgroundColor,
      ),
      padding: const EdgeInsets.only(left: 16, bottom: 16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: context.isDarkMode ? kNeutral800 : kNeutral200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Actions',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 16)
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child:  Divider(),
                ),
                InkWell(
                  onTap: (){
                    AutoRouter.of(context).pop();
                  },
                  child: Text(
                    'Edit',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 16)
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                InkWell(
                  onTap: (){
                    AutoRouter.of(context).pop();
                  },
                  child: Text(
                    'Select',
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 16)
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                InkWell(
                  onTap: (){
                    AutoRouter.of(context).pop();
                  },
                  child: Text(
                    'Share',
                    style:Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 16)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
