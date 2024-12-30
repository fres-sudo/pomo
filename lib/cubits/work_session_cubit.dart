import 'package:bloc/bloc.dart';
import 'package:pomo/models/task/task.dart';

class WorkSessionCubit extends Cubit<Task?> {
  WorkSessionCubit(super.task);

  void set(Task task) {
    emit(task);
  }

  void clear() {
    emit(null);
  }
}
