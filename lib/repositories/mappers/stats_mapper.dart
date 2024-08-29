import 'package:pine/pine.dart';
import 'package:pomo/models/stats/stats.dart';
import 'package:pomo/services/network/jto/stats/stats_jto.dart';

class StatsMapper extends DTOMapper<StatsJTO, Stats> {

  @override
  Stats fromDTO(StatsJTO dto) => Stats(
    totalTasksToday: dto.totalTasksToday,
    totalTasksYesterday: dto.totalTasksYesterday,
    totalTasksAll: dto.totalTasksAll,
    completedTasksOfTheWeek: dto.completedTasksOfTheWeek,
    uncompletedTasksOfTheWeek: dto.uncompletedTasksOfTheWeek,
    completionPercentage: dto.completionPercentage
  );

  @override
  StatsJTO toDTO(Stats model) => StatsJTO(
    totalTasksToday: model.totalTasksToday,
    totalTasksYesterday: model.totalTasksYesterday,
    totalTasksAll: model.totalTasksAll,
    completionPercentage: model.completionPercentage,
    completedTasksOfTheWeek: model.completedTasksOfTheWeek,
    uncompletedTasksOfTheWeek: model.completedTasksOfTheWeek
  );
}
