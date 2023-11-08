import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';
import 'package:todolist/app/models/task_filter_enum.dart';
import 'package:todolist/app/models/total_task_model.dart';
import 'package:todolist/app/modules/home/home_controller.dart';
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
                label: 'HOJE',
                taskFilterEnum: TaskFilterEnum.tomarrow,
                totalTaskModule:
                    context.select<HomeController, TotalTaskModel?>(
                  (controller) => controller.todayTotalTasks,
                ),
                selected: context.select<HomeController, TaskFilterEnum>(
                      (value) => value.filterSelected,
                    ) ==
                    TaskFilterEnum.today,
              ),
              HomeCardFilter(
                label: 'AMANHÃ',
                taskFilterEnum: TaskFilterEnum.today,
                totalTaskModule:
                    context.select<HomeController, TotalTaskModel?>(
                  (controller) => controller.tomorrowTotalTasks,
                ),
                selected: context.select<HomeController, TaskFilterEnum>(
                      (value) => value.filterSelected,
                    ) ==
                    TaskFilterEnum.tomarrow,
              ),
              HomeCardFilter(
                label: 'SEMANA',
                taskFilterEnum: TaskFilterEnum.week,
                totalTaskModule:
                    context.select<HomeController, TotalTaskModel?>(
                  (controller) => controller.weekTotalTasks,
                ),
                selected: context.select<HomeController, TaskFilterEnum>(
                      (value) => value.filterSelected,
                    ) ==
                    TaskFilterEnum.week,
              ),
              HomeCardFilter(
                label: 'MÊS',
                taskFilterEnum: TaskFilterEnum.mounth,
                totalTaskModule: TotalTaskModel(
                  totalTasks: 40,
                  totalTasksFinish: 40,
                ),
                selected: context.select<HomeController, TaskFilterEnum>(
                      (value) => value.filterSelected,
                    ) ==
                    TaskFilterEnum.mounth,
              ),
            ],
          ),
        )
      ],
    );
  }
}
