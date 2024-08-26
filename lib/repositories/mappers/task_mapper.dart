import 'package:pine/pine.dart';
import 'package:pomo/models/task/task.dart';
import 'package:pomo/services/network/jto/task/task_jto.dart';
import '../../models/project/project.dart';
import '../../models/user/user.dart';
import '../../services/network/jto/project/project_jto.dart';
import '../../services/network/jto/user/user_jto.dart';

class TaskMapper extends DTOMapper<TaskJTO, Task> {
  const TaskMapper({
    required this.userMapper,
  });

  final DTOMapper<UserJTO, User> userMapper;

  @override
  Task fromDTO(TaskJTO dto) => Task(
        id: dto.id,
        name: dto.name,
        description: dto.description,
        pomodoro: dto.pomodoro,
        pomodoroCompleted: dto.pomodoroCompleted,
        user: userMapper.fromDTO(dto.user),
        createdAt: dto.createdAt,
        completedAt: dto.completedAt,
      );

  @override
  TaskJTO toDTO(Task model) => TaskJTO(
      id: model.id,
      name: model.name,
      description: model.description,
      pomodoro: model.pomodoro,
      pomodoroCompleted: model.pomodoroCompleted,
      user: userMapper.toDTO(model.user),
      createdAt: model.createdAt,
      completedAt: model.completedAt
  );
}
