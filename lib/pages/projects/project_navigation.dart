import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/project/project_bloc.dart';

@RoutePage()
class ProjectNavigation extends StatelessWidget {
  const ProjectNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
