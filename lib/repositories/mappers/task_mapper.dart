import 'package:pine/pine.dart';
import 'package:pomo/models/task/task.dart';
import 'package:pomo/repositories/mappers/project_mapper.dart';
import 'package:pomo/repositories/mappers/user_mapper.dart';
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
        pomodoro: dto.pomodoro,
        completed: dto.completed,
        user: dto.user,
        referenceProjectId: dto.referenceProjectId,
      );

  @override
  TaskJTO toDTO(Task model) => TaskJTO(
      id: model.id,
      name: model.id,
      pomodoro: model.pomodoro,
      completed: model.completed,
      user: model.user,
      referenceProjectId: model.referenceProjectId
  );
}
