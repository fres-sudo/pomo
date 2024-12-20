import 'package:pine/pine.dart';
import 'package:pomo/services/network/stats/stats_service.dart';

import '../constants/constants.dart';
import '../models/stats/stats.dart';
import '../services/network/jto/stats/stats_jto.dart';

/// Abstract class of StatsRepository
abstract class StatsRepository {
  Future<Stats> fetchStats({required String userId});
}

/// Implementation of the base interface StatsRepository
class StatsRepositoryImpl implements StatsRepository {
  const StatsRepositoryImpl({required this.statsService, required this.statsMapper});

  final StatsService statsService;
  final DTOMapper<StatsJTO, Stats> statsMapper;

  @override
  Future<Stats> fetchStats({required String userId}) async {
      final dto = await statsService.getStatsByUser(userId);
      return statsMapper.fromDTO(dto);
  }
}
