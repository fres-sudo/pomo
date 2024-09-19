import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/project/project_bloc.dart';
import 'package:pomo/components/widgets/top_bottom_sheet_widget.dart';
import 'package:pomo/extension/date_extension.dart';
import 'package:pomo/routes/app_router.gr.dart';

import '../../../components/fields/date_field.dart';
import '../../../components/widgets/snack_bars.dart';
import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';
import '../../../models/project/project.dart';

class EditProjectView extends StatefulWidget {
  const EditProjectView({super.key, required this.project});

  final Project project;

  @override
  State<EditProjectView> createState() => _EditProjectViewState();
}

class _EditProjectViewState extends State<EditProjectView> {
  final _nameTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    _nameTextController.text = widget.project.name;
    _descriptionTextController.text = widget.project.description ?? "";
    _startDate = widget.project.startDate;
    _endDate = widget.project.endDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom:16),
      child: ListView(
        children: [
          const TopBottomSheetWidget(),
          Gap.MD,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 40,
              ),
              const Spacer(),
              Text("${t.general.edit} ${t.projects.title}", style: Theme.of(context).textTheme.titleMedium),
              const Spacer(),
              InkWell(
                onTap: () {
                  if(_endDate == null || _startDate == null || _nameTextController.text.length < 3){
                    onInvalidInput(context);
                    return;
                  }
                  if (_endDate != null && _endDate!.isBeforeDay(DateTime.now())) {
                    onInvalidInput(context, text: t.errors.due_date_before_today);
                    return;
                  }
                  context.read<ProjectBloc>().updateProjectById(id: widget.project.id ?? "", project: widget.project.copyWith(
                    name: _nameTextController.text,
                    description: _descriptionTextController.text,
                    startDate: _startDate!,
                    endDate: _endDate!
                  ));
                  context.router.maybePop();
                  context.router.replace(const ProjectRoute());
                },
                child: Text(t.general.edit, style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).primaryColor
                )),
              ),
            ],
          ),
          Gap.SM,
          const Divider(),
          Gap.XS,
          Text("${t.general.name}*", style: Theme.of(context).textTheme.titleMedium),
          Gap.XS,
          TextFormField(
            controller: _nameTextController,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: t.general.name,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).dividerColor)
              ),
              focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Theme.of(context).dividerColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Theme.of(context).dividerColor)
              ),

            ),
            onChanged: (_) => setState(() {}),
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 3) {
                return 'Please enter a valid project name';
              }
              return null;
            },
          ),
          Gap.MD,
          Text(t.general.description, style: Theme.of(context).textTheme.titleMedium),
          Gap.XS,
          TextFormField(
            controller: _descriptionTextController,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 5,
            decoration: InputDecoration(
                hintText: t.general.description,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).dividerColor)
                ),
                focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Theme.of(context).dividerColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Theme.of(context).dividerColor)
                )
            ),
          ),
          Gap.MD,
          Text(t.general.start_date, style: Theme.of(context).textTheme.titleMedium),
          Gap.XS,
          DateField(
              selectedDate: _startDate,
              borderRadius: 12,
              borderColor: Theme.of(context).dividerColor,
              onPress: (date) => setState(() {
                _startDate = date;
              }),
              onDelete: () => setState(() {
                _startDate = null;
              })),
          Gap.MD,
          Text("${t.general.due_date}*", style: Theme.of(context).textTheme.titleMedium),
          Gap.XS,
          DateField(
              firstDate: _startDate,
              selectedDate: _endDate,
              borderRadius: 12,
              borderColor: Theme.of(context).dividerColor,
              onPress: (date) => setState(() {
                _endDate = date;
              }),
              onDelete: () => setState(() {
                _endDate = null;
              })),

        ],
      ),
    );
  }
}