import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../extension/sized_box_extension.dart';
import '../../i18n/strings.g.dart';
import '../../routes/app_router.gr.dart';

class NoStatsPage extends StatelessWidget {
  const NoStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 7,
        ),
        Image.asset(
          "assets/images/statistics.png",
          scale: 0.85,
        ),
        Gap.MD,
        Text(
          "${t.general.still_dont_have} \n ${t.stats.any_stats}",
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        Gap.MD,
        ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size(220, 48)),
            onPressed: () => AutoTabsRouter.of(context).setActiveIndex(2),
            child: Text(
              t.tasks.start_quick_session,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
            ))
      ],
    );
  }
}
