import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pine/pine.dart';
import 'package:pomo/blocs/sign_in/sign_in_bloc.dart';
import 'package:pomo/blocs/stats/stats_bloc.dart';
import 'package:pomo/cubits/timer/timer_cubit.dart';
import 'package:pomo/i18n/strings.g.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/repositories/authentication_repository.dart';
import 'package:pomo/repositories/mappers/project_mapper.dart';
import 'package:pomo/repositories/mappers/stats_mapper.dart';
import 'package:pomo/repositories/mappers/user_string_mapper.dart';
import 'package:pomo/repositories/project_repository.dart';
import 'package:pomo/repositories/stats_repository.dart';
import 'package:pomo/repositories/task_repository.dart';
import 'package:pomo/repositories/user_repository.dart';
import 'package:pomo/services/cookies/shared_pref_storage.dart';
import 'package:pomo/services/network/authentication/authentication_service.dart';
import 'package:pomo/services/network/jto/stats/stats_jto.dart';
import 'package:pomo/services/network/jto/task/task_jto.dart';
import 'package:pomo/services/network/response/sign_up/sign_up_response.dart';
import 'package:pomo/services/network/stats/stats_service.dart';
import 'package:pomo/services/network/user/user_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../blocs/project/project_bloc.dart';
import '../blocs/sign_up/sign_up_bloc.dart';
import '../blocs/task/task_bloc.dart';
import '../blocs/user/user_bloc.dart';
import '../constants/constants.dart';
import '../cubits/auth/auth_cubit.dart';
import '../cubits/theme/theme_cubit.dart';
import '../models/stats/stats.dart';
import '../models/task/task.dart';
import '../models/user/user.dart';
import '../repositories/mappers/sign_up_response_mapper.dart';
import '../repositories/mappers/task_mapper.dart';
import '../repositories/mappers/user_mapper.dart';
import '../services/network/interceptors/auth_interceptor.dart';
import '../services/network/jto/project/project_jto.dart';
import '../services/network/jto/user/user_jto.dart';
import '../services/network/project/project_service.dart';
import '../services/network/task/task_service.dart';
import 'package:path/path.dart' as path;

part 'blocs.dart';

part 'mappers.dart';

part 'providers.dart';

part 'repositories.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => DependencyInjectorHelper(
        blocs: _blocs,
        mappers: _mappers,
        providers: _providers,
        repositories: _repositories,
        child: child,
      );
}
