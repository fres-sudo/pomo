import 'package:flutter/cupertino.dart';

import '../i18n/strings.g.dart';
import 'generic_error.dart';
import 'localized.dart';

abstract class StatsError extends LocalizedError {
  static LocalizedError fromMessage(String? message) {
    return GenericError();
  }
}

class FetchingStatsError extends StatsError {
  @override
  String localizedString(BuildContext context) {
    return context.t.errors.stats.fetching_stats;
  }
}