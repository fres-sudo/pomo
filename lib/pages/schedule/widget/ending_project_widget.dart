import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../blocs/project/project_bloc.dart';
import '../../../components/widgets/dotted_divider.dart';
import '../../../constants/colors.dart';
import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';

class EndingProjectWidget extends StatelessWidget {
  const EndingProjectWidget({super.key, required this.focusedDay});

  final DateTime focusedDay;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, projectState) {
        final endingProjects = switch (projectState) {
          FetchedProjectState(:final projects) =>
            projects.where((p) => isSameDay(p.endDate, focusedDay)).toList(growable: false),
          _ => []
        };
        final isLoading = switch (projectState) { FetchingProjectState() => true, _ => false };
        return endingProjects.isNotEmpty
            ? Skeletonizer(
                enabled: isLoading,
                child: Column(
                  children: [
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                          color: kPrimary500, borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.playlist_add_check_rounded,
                            color: Colors.white,
                          ),
                          Gap.SM_H,
                          Text(
                            "${t.projects.ending_today}: ",
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          Expanded(
                            child: Text(
                              endingProjects.map((p) => p.name).toList(growable: false).join(', '),
                              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: Colors.white,
                                  ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                    Gap.XS,
                    const DottedDivider(),
                    Gap.XS,
                  ],
                ),
              )
            : const SizedBox();
      },
    );
  }
}
