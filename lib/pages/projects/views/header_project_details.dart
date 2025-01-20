import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/components/widgets/back_icon_button.dart';
import 'package:pomo/components/widgets/snack_bars.dart';
import 'package:pomo/extension/sized_box_extension.dart';

import '../../../constants/colors.dart';
import '../../../constants/text.dart';
import '../../../i18n/strings.g.dart';
import '../../../models/project/project.dart';
import '../../../routes/app_router.gr.dart';
import '../widget/project_bottom_sheet.dart';

class HeaderProjectDetails extends StatelessWidget {
  const HeaderProjectDetails({super.key, required this.project, this.isProjectCreated = false});

  final Project project;
  final bool isProjectCreated;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BackIconButton(onPress: () {
              if (isProjectCreated) {
                context.router.replaceAll([const ProjectRoute()]);
              } else {
                context.router.maybePop();
              }
            }),
            Gap.SM_H,
            Expanded(child: Text(project.name.capitalize(), overflow: TextOverflow.ellipsis, style: kSerzif(context))),
            IconButton(
                onPressed: () => showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      useRootNavigator: true,
                      builder: (BuildContext context) {
                        return ProjectBottomSheet(project: project);
                      },
                    ),
                icon: const Icon(Icons.more_horiz_rounded)),
          ],
        ),
        Gap.SM,
        Text(
            project.description == null || project.description!.isEmpty
                ? t.general.no_description
                : project.description!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kNeutral600)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => onAvailableSoon(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  t.projects.invite_friends,
                  style: GoogleFonts.inter(
                      fontSize: 12, fontWeight: FontWeight.w500, color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Text(
              "${t.tasks.create.due_date}: ${DateFormat('MMM dd, yyyy', TranslationProvider.of(context).flutterLocale.languageCode).format(project.endDate).capitalize()}",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
            )
          ],
        ),
        const Divider(),
        Gap.SM,
      ],
    );
  }
}
