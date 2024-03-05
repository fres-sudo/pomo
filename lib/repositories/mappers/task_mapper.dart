import 'package:pine/pine.dart';
import 'package:pomo/models/task/task.dart';
import 'package:pomo/repositories/mappers/project_mapper.dart';
import 'package:pomo/repositories/mappers/user_mapper.dart';
import 'package:pomo/services/network/jto/task/task_jto.dart';

class TaskMapper extends DTOMapper<TaskJTO, Task> {
  const TaskMapper({
    required this.userMapper,
    required this.projectMapper,
  });

  final UserMapper userMapper;
  final ProjectMapper projectMapper;

  @override
  Task fromDTO(TaskJTO dto) => Task(
        id: dto.id,
        name: dto.name,
        pomodoro: dto.pomodoro,
        completed: dto.completed,
        user: userMapper.fromDTO(dto.user),
        referenceProject: dto.referenceProject != null ? projectMapper.fromDTO(dto.referenceProject!) : null
      );

  @override
  TaskJTO toDTO(Task model) => TaskJTO(
      id: model.id,
      name: model.id,
      pomodoro: model.pomodoro,
      completed: model.completed,
      user: userMapper.toDTO(model.user),
      referenceProject: model.referenceProject != null ? projectMapper.toDTO(model.referenceProject!) : null
  );
}
