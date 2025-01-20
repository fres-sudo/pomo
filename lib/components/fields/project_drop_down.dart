import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../blocs/project/project_bloc.dart';
import '../../extension/sized_box_extension.dart';
import '../../i18n/strings.g.dart';
import '../../models/project/project.dart';
import '../../models/task/task.dart';

class ProjectDropDown extends StatefulWidget {
  const ProjectDropDown({super.key, required this.onChanged, required this.onDelete, this.selectedProject, required this.visible, this.task});

  final Task? task;
  final Function(Project? project) onChanged;
  final VoidCallback onDelete;
  final Project? selectedProject;
  final bool visible;

  @override
  State<ProjectDropDown> createState() => _ProjectDropDownState();
}

class _ProjectDropDownState extends State<ProjectDropDown> {
  Project? _selectedProject;

  @override
  void initState() {
    super.initState();
    _selectedProject = widget.selectedProject;
  }

  @override
  void didUpdateWidget(covariant ProjectDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedProject != oldWidget.selectedProject) {
      setState(() {
        _selectedProject = widget.selectedProject;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        if (!widget.visible) return const SizedBox();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              t.tasks.create.project,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
            ),
            Gap.XS,
            Row(
              children: [
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<Project>(
                        value: _selectedProject,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.secondary,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Theme.of(context).dividerColor,
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Theme.of(context).dividerColor,
                                width: 1,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Theme.of(context).dividerColor,
                                width: 1,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            constraints: BoxConstraints()),
                        hint: Text(t.tasks.create.select_a_project),
                        dropdownColor: Theme.of(context).colorScheme.secondary,
                        icon: const Icon(Icons.arrow_drop_down),
                        style: Theme.of(context).textTheme.bodyMedium,
                        alignment: Alignment.centerLeft,
                        // Aligns the dropdown under the button
                        onChanged: (Project? newValue) {
                          setState(() {
                            _selectedProject = newValue;
                          });
                          widget.onChanged(newValue);
                        },
                        items: state.maybeWhen(
                            fetching: () => [],
                            fetched: (projects) => projects.map((Project project) {
                                  return DropdownMenuItem<Project>(
                                    value: project,
                                    child: Text(
                                      project.name,
                                      style: Theme.of(context).textTheme.labelMedium,
                                    ),
                                  );
                                }).toList(),
                            orElse: () => [])),
                  ),
                ),
                if (_selectedProject != null)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedProject = null;
                      });
                      widget.onChanged(null);
                      widget.onDelete();
                    },
                    icon: Icon(
                      Icons.clear_rounded,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
