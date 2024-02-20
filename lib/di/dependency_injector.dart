import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pine/pine.dart';
import 'package:pomo/services/network/authentication/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/constants.dart';
import '../cubits/theme/theme_cubit.dart';
import '../providers/fields/email_provider.dart';
import '../providers/fields/name_provider.dart';
import '../providers/fields/password_provider.dart';

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
