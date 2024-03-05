import 'package:pine/pine.dart';
import 'package:pomo/models/project/project.dart';
import 'package:pomo/models/task/task.dart';
import 'package:pomo/repositories/mappers/task_mapper.dart';
import 'package:pomo/repositories/mappers/user_mapper.dart';
import 'package:pomo/services/network/jto/project/project_jto.dart';
import 'package:pomo/services/network/jto/task/task_jto.dart';

class ProjectMapper extends DTOMapper<ProjectJTO, Project> {
  const ProjectMapper({
    required this.userMapper,
    required this.taskMapper,
});

  final UserMapper userMapper;
  final TaskMapper taskMapper;

  @override
  Project fromDTO(ProjectJTO dto) => Project(
        id: dto.id,
        name: dto.name,
        description: dto.description,
        dueDate: dto.dueDate,
        owner: userMapper.fromDTO(dto.owner),
        tasks: dto.tasks != null ? dto.tasks?.map((taskDto) => taskMapper.fromDTO(taskDto)).toList() : [],
        contributors: dto.contributors != null ? dto.contributors?.map((userDto) => userMapper.fromDTO(userDto)).toList() : [],
        imageCover: dto.imageCover,
      );

  @override
  ProjectJTO toDTO(Project model) => ProjectJTO(
        id: model.id,
        name: model.name,
        description: model.description,
        dueDate: model.dueDate,
        owner: userMapper.toDTO(model.owner),
        tasks: model.tasks != null ? model.tasks?.map((taskDto) => taskMapper.toDTO(taskDto)).toList() : [],
        contributors: model.contributors != null ? model.contributors?.map((userDto) => userMapper.toDTO(userDto)).toList() : [],
        imageCover: model.imageCover,
      );
}
