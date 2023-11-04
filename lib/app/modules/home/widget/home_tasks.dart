import 'package:flutter/material.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';
import 'package:todolist/app/modules/home/widget/task.dart';

class HomeTasks extends StatelessWidget {
  const HomeTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'TASK\'S DE HOJE',
            style: context.titleStyle.copyWith(fontSize: 12),
          ),
          const Column(
            children: [
              Task(),
              Task(),
              Task(),
              Task(),
              Task(),
            ],
          )
        ],
      ),
    );
  }
}
