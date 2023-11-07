import 'package:flutter/material.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';
import 'package:todolist/app/models/task_filter_enum.dart';
import 'package:todolist/app/models/total_task_module.dart';
import 'package:todolist/app/modules/home/widget/home_card_filter.dart';

class HomeFilters extends StatelessWidget {
  const HomeFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filtros',
          style: context.titleStyle,
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HomeCardFilter(
                label: 'AMANHÃ',
                taskFilterEnum: TaskFilterEnum.today,
                totalTaskModule: TotalTaskModule(
                  totalTasks: 10,
                  totalTasksFinish: 10,
                ),
              ),
              HomeCardFilter(
                label: 'HOJE',
                taskFilterEnum: TaskFilterEnum.tomarrow,
                totalTaskModule: TotalTaskModule(
                  totalTasks: 20,
                  totalTasksFinish: 5,
                ),
              ),
              HomeCardFilter(
                label: 'SEMANA',
                taskFilterEnum: TaskFilterEnum.week,
                totalTaskModule: TotalTaskModule(
                  totalTasks: 30,
                  totalTasksFinish: 5,
                ),
              ),
              HomeCardFilter(
                label: 'MÊS',
                taskFilterEnum: TaskFilterEnum.mounth,
                totalTaskModule: TotalTaskModule(
                  totalTasks: 40,
                  totalTasksFinish: 40,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
