import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/project/project_bloc.dart';
import '../../models/project/project.dart';

class ProjectDropDown extends StatefulWidget {
  const ProjectDropDown({
    super.key,
    required this.onChanged,
    required this.onDelete,
    this.selectedProject,
    required this.visible,
  });

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
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<Project>(
                    value: _selectedProject,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.secondary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 3,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    ),
                    hint: const Text('Select a Project'),
                    dropdownColor: Theme.of(context).colorScheme.secondary,
                    icon: const Icon(Icons.arrow_drop_down),
                    style: Theme.of(context).textTheme.bodyMedium,
                    onChanged: (Project? newValue) {
                      setState(() {
                        _selectedProject = newValue;
                      });
                      widget.onChanged(newValue);
                    },
                    items: state.projects.map((Project project) {
                      return DropdownMenuItem<Project>(
                        value: project,
                        child: Text(
                          project.name,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      );
                    }).toList(),
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
