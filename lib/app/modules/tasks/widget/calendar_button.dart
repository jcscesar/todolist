import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';
import 'package:todolist/app/modules/tasks/tasks_controller.dart';

class CalendarButton extends StatelessWidget {
  final dateFormat = DateFormat('dd/MM/y');
  CalendarButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        var lastDate = DateTime.now();
        lastDate = lastDate.add(const Duration(days: 30 * 365));
        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(
            DateTime.now().year + 10,
            DateTime.now().month + 13,
            DateTime.now().day + 25,
          ),
        );
        // ignore: use_build_context_synchronously
        context.read<TasksController>().selectedDate = selectedDate;
      },
      borderRadius: BorderRadius.circular(30),
      child: SizedBox(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.today,
              ),
              const SizedBox(width: 10),
              Selector<TasksController, DateTime?>(
                selector: (context, controller) => controller.selectedDate,
                builder: (context, selectedDate, child) {
                  if (selectedDate != null) {
                    return Text(
                      dateFormat.format(selectedDate),
                      style: context.titleStyle.copyWith(fontSize: 12),
                    );
                  } else {
                    return Text(
                      'SELECIONE UMA DATA',
                      style: context.titleStyle.copyWith(fontSize: 12),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
