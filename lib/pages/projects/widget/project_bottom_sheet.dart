import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/project/project_bloc.dart';
import 'package:pomo/components/utils/utils.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/pages/projects/project_page.dart';
import 'package:pomo/routes/app_router.gr.dart';

import '../../../components/widgets/destruction_bottomsheet.dart';
import '../../../models/project/project.dart';

class ProjectBottomSheet extends StatelessWidget {
  const ProjectBottomSheet({super.key, required this.project});

  final Project project;

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
      padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
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
                color: Theme.of(context).bottomSheetTheme
                    .backgroundColor,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                      },
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
                            const Icon(Icons.share_rounded, color: kGreen500,),
                            const SizedBox(
                              height: 8,
                            ),
                            Text("Share", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: kGreen500),)
                          ],
                        )
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        context.router.pop().then((value) => showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return DestructionBottomSheet(
                                title: "Project",
                                buttonText: 'Delete',
                                description:
                                "Are you sure you want to delete this project?",
                                function: () {
                                  context.read<ProjectBloc>().deleteProjectById(id: project.id!);
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
                            const Icon(Icons.delete_forever, color: kRed500,),
                            const SizedBox(
                              height: 8,
                            ),
                            Text("Delete", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: kRed500),)
                          ],
                        )
                      ),
                    )
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
