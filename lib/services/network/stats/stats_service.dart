import 'package:dio/dio.dart';
import 'package:pomo/services/network/jto/stats/stats_jto.dart';
import 'package:retrofit/retrofit.dart';

part 'stats_service.g.dart';

@RestApi()
abstract class StatsService {
  factory StatsService(Dio dio, {String baseUrl}) = _StatsService;

  @GET('/stats/{userId}')
  Future<StatsJTO> getStatsByUser(@Path('userId') String userId);

}