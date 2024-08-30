import 'package:pine/pine.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/models/task/task.dart';
import 'package:pomo/services/network/jto/project/project_jto.dart';
import 'package:pomo/services/network/jto/task/task_jto.dart';

import '../../models/user/user.dart';
import '../../services/network/jto/user/user_jto.dart';

class ProjectMapper extends DTOMapper<ProjectJTO, Project> {
  const ProjectMapper({
    required this.userMapper,
    required this.taskMapper,
});

  final DTOMapper<UserJTO, User> userMapper;
  final DTOMapper<TaskJTO, Task> taskMapper;

  @override
  Project fromDTO(ProjectJTO dto) => Project(
        id: dto.id ,
        name: dto.name,
        description: dto.description,
        startDate: dto.startDate,
        endDate: dto.endDate,
        userId: dto.userId,
        tasks: dto.tasks?.map((taskDto) => taskMapper.fromDTO(taskDto)).toList() ?? [],
        contributors: dto.contributors?.map((userDto) => userMapper.fromDTO(userDto)).toList() ?? [],
        imageCover: dto.imageCover,
        completedAt: dto.completedAt,
        createdAt: dto.createdAt
      );

  @override
  ProjectJTO toDTO(Project model) => ProjectJTO(
        id: model.id,
        name: model.name,
        description: model.description,
        startDate: model.startDate,
        endDate: model.endDate,
        userId: model.userId,
        tasks: model.tasks?.map((taskDto) => taskMapper.toDTO(taskDto)).toList() ?? [],
        contributors: model.contributors?.map((userDto) => userMapper.toDTO(userDto)).toList() ?? [],
        imageCover: model.imageCover,
        completedAt: model.completedAt,
        createdAt: model.createdAt
      );
}
