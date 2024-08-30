import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/project/project_bloc.dart';
import 'package:pomo/components/widgets/snack_bars.dart';
import 'package:pomo/constants/colors.dart';

import '../../../components/widgets/destruction_bottomsheet.dart';
import '../../../components/widgets/top_bottom_sheet_widget.dart';
import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';
import '../../../models/project/project.dart';

class ProjectBottomSheet extends StatelessWidget {
  const ProjectBottomSheet({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black12, spreadRadius: 1000, blurRadius: 100),
        ],
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
      ),
      padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TopBottomSheetWidget(),
          Gap.MD,
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t.general.actions, style: Theme.of(context).textTheme.titleMedium),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => onAvailableSoon(context),
                    child: Container(
                        width: MediaQuery.sizeOf(context).width / 2 - 20,
                        decoration: BoxDecoration(
                          color: kGreen500.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.share_rounded,
                              color: kGreen500,
                            ),
                            Gap.SM,
                            Text(
                              "Share",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: kGreen500),
                            )
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      context.router.maybePop().then((value) => showModalBottomSheet(
                          context: context,
                          useRootNavigator: true,
                          builder: (BuildContext context) {
                            return DestructionBottomSheet(
                              title: t.projects.delete.title,
                              buttonText: t.general.delete,
                              description: t.projects.delete.description,
                              function: () {
                                context.read<ProjectBloc>().deleteProjectById(id: project.id!);
                                context.router.maybePop();
                              },
                            );
                          },
                          isDismissible: true));
                    },
                    child: Container(
                        width: MediaQuery.sizeOf(context).width / 2 - 20,
                        decoration: BoxDecoration(
                          color: kRed500.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.delete_forever,
                              color: kRed500,
                            ),
                            Gap.SM,
                            Text(
                              t.general.delete,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: kRed500),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
