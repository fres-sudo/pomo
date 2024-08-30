import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pomo/components/widgets/snack_bars.dart';
import 'package:pomo/extension/sized_box_extension.dart';

import '../../../constants/colors.dart';
import '../../../constants/text.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => isProjectCreated ? context.router.replace(const ProjectRoute()) : context.router.maybePop(),
                  child: Icon(Icons.chevron_left_outlined),
                ),
                Gap.SM_H,
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Text(project.name, overflow: TextOverflow.ellipsis, style: kSerzif(context)),
                ),
              ],
            ),
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isDismissible: true,
                  useRootNavigator: true,
                  builder: (BuildContext context) {
                    return ProjectBottomSheet(project: project);
                  },
                );
              },
              child: SvgPicture.asset(
                "assets/icons/kebab.svg",
                colorFilter: ColorFilter.mode(Theme.of(context).iconTheme.color!, BlendMode.srcIn),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(project.description == null || project.description!.isEmpty ? "No description" : project.description!,
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
                  "Invite friend",
                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: kPrimary500),
                ),
              ),
            ),
            Text(
              "Due date: ${DateFormat('MMM dd, yyyy').format(project.endDate)}",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: kNeutral500),
            )
          ],
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
