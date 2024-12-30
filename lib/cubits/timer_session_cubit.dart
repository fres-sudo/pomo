import 'package:bloc/bloc.dart';

class TimerSessionState {
  final bool isRunning;
  final bool isPaused;
  final Duration remainingTime;
  final Duration totalDuration;
  final bool isQuickSession;

  TimerSessionState({
    required this.isRunning,
    required this.isPaused,
    required this.remainingTime,
    required this.totalDuration,
    required this.isQuickSession,
  });

  double get progress => totalDuration.inSeconds > 0
      ? (remainingTime.inSeconds / totalDuration.inSeconds)
      : 0;
}

class TimerSessionCubit extends Cubit<TimerSessionState> {
  TimerSessionCubit()
      : super(TimerSessionState(
    isRunning: false,
    isPaused: false,
    remainingTime: Duration.zero,
    totalDuration: Duration.zero,
    isQuickSession: false,
  ));

  void startTimer(Duration duration, {bool isQuickSession = false}) {
    emit(TimerSessionState(
      isRunning: true,
      isPaused: false,
      remainingTime: duration,
      totalDuration: duration,
      isQuickSession: isQuickSession,
    ));
  }

  void updateRemainingTime(Duration remainingTime, {bool isQuickSession = false}) {
    emit(TimerSessionState(
      isRunning: state.isRunning,
      isPaused: state.isPaused,
      remainingTime: remainingTime,
      totalDuration: state.totalDuration,
      isQuickSession: isQuickSession,
    ));
  }

  void pauseTimer(bool isQuickSession) {
    emit(TimerSessionState(
      isRunning: false,
      isPaused: true,
      remainingTime: state.remainingTime,
      totalDuration: state.totalDuration,
      isQuickSession: isQuickSession,
    ));
  }

  void resumeTimer(bool isQuickSession) {
    emit(TimerSessionState(
      isRunning: true,
      isPaused: false,
      remainingTime: state.remainingTime,
      totalDuration: state.totalDuration,
      isQuickSession: isQuickSession,
    ));
  }

  void stopTimer(bool isQuickSession) {
    emit(TimerSessionState(
      isRunning: false,
      isPaused: false,
      remainingTime: state.remainingTime,
      totalDuration: state.totalDuration,
      isQuickSession: isQuickSession,
    ));
  }
}
