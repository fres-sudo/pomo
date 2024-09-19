import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../components/widgets/top_bottom_sheet_widget.dart';
import '../../../cubits/filter_project/filter_project_cubit.dart';
import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';

class FilterProjectWidget extends StatelessWidget {
  final Function(SortOption, bool) onApplyFilter;

  const FilterProjectWidget({super.key, required this.onApplyFilter});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> sortOptions = [
      {'label': t.general.start_date, 'value': SortOption.startDate},
      {'label': t.tasks.create.due_date, 'value': SortOption.endDate},
      {'label': t.general.name, 'value': SortOption.name},
      {'label': t.general.completed_task, 'value': SortOption.completedTasks},
    ];

    return BlocBuilder<FilterProjectCubit, FilterProjectState>(
      builder: (context, state) {
        return Container(
          height: MediaQuery.of(context).size.height - 200,
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 26),
          decoration: BoxDecoration(
            color: Theme.of(context).bottomSheetTheme.backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopBottomSheetWidget(),
              Gap.MD,
              Text(
                t.general.filter_and_sort,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Gap.XS,
              const Divider(),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: sortOptions.map((option) => ChoiceChip(
                  label: Text(
                    option['label'],
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  selected: option['value'] == state.sortOption,
                  onSelected: (value) => context.read<FilterProjectCubit>().updateSortOption(option['value']),
                )).toList(growable: false),
              ),
              Gap.SM,
              const Divider(),
              Gap.SM,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('${t.general.order}:'),
                  const Spacer(),
                  ChoiceChip(
                    label: Text(t.general.ascending,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: state.isAscending ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    selected: state.isAscending,
                    onSelected: (_) => context.read<FilterProjectCubit>().toggleSortOrder(),
                  ),
                  Gap.SM_H,
                  ChoiceChip(
                    label: Text(t.general.descending,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: !state.isAscending ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    selected: !state.isAscending,
                    onSelected: (_) => context.read<FilterProjectCubit>().toggleSortOrder(),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  context.read<FilterProjectCubit>().applyFilter();
                  onApplyFilter(state.sortOption, state.isAscending);
                  Navigator.pop(context);
                },
                child: Center(child: Text(t.general.apply)),
              ),
            ],
          ),
        );
      },
    );
  }
}