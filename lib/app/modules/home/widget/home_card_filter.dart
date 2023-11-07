import 'package:flutter/material.dart';
import 'package:todolist/app/core/ui/colors_extensions.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';
import 'package:todolist/app/models/task_filter_enum.dart';
import 'package:todolist/app/models/total_task_module.dart';

class HomeCardFilter extends StatelessWidget {
  final String label;
  final TaskFilterEnum taskFilterEnum;
  final TotalTaskModule? totalTaskModule;

  const HomeCardFilter({
    Key? key,
    required this.label,
    required this.taskFilterEnum,
    this.totalTaskModule,
  }) : super(key: key);

  double _getPercentFinish() {
    final total = totalTaskModule?.totalTasks ?? 0.1;
    final totalFinish = totalTaskModule?.totalTasksFinish ?? 0.1;
    if (total == 0) return 0.0;
    final percent = (totalFinish * 100) / total;
    return percent / 100;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 120,
        maxWidth: 150,
      ),
      decoration: BoxDecoration(
        color: context.primaryColor,
        border: Border.all(
          width: 1,
          color: ColorsExtensions().cinza.withOpacity(.8),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: 21,
          //   width: 21,
          //   child: CircularProgressIndicator(),
          // ),
          Text(
            '${totalTaskModule?.totalTasks ?? 0} TASKS',
            style: context.titleStyle.copyWith(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          // ),
          Text(
            label,
            style: context.titleStyle.copyWith(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          TweenAnimationBuilder<double>(
            tween: Tween(
              begin: 0.0,
              end: _getPercentFinish(),
            ),
            duration: const Duration(seconds: 1),
            builder: (context, value, child) {
              return LinearProgressIndicator(
                value: value,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
                backgroundColor: context.primaryColorLight,
              );
            },
          ),
        ],
      ),
    );
  }
}
