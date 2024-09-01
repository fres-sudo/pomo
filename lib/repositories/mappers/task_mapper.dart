import 'package:pine/pine.dart';
import 'package:pomo/models/task/task.dart';
import 'package:pomo/services/network/jto/task/task_jto.dart';

class TaskMapper extends DTOMapper<TaskJTO, Task> {
  const TaskMapper();


  @override
  Task fromDTO(TaskJTO dto) => Task(
        id: dto.id,
        name: dto.name,
        description: dto.description,
        pomodoro: dto.pomodoro,
        pomodoroCompleted: dto.pomodoroCompleted,
        userId: dto.userId,
        projectId: dto.projectId,
        createdAt: dto.createdAt,
        completedAt: dto.completedAt,
        highPriority: dto.highPriority,
        dueDate: dto.dueDate
      );

  @override
  TaskJTO toDTO(Task model) => TaskJTO(
      id: model.id,
      name: model.name,
      description: model.description,
      pomodoro: model.pomodoro,
      pomodoroCompleted: model.pomodoroCompleted,
      userId: model.userId,
      projectId: model.projectId,
      createdAt: model.createdAt,
      highPriority: model.highPriority,
      completedAt: model.completedAt,
      dueDate: model.dueDate
  );
}
