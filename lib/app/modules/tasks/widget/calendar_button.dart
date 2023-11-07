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
        final now = DateTime.now();
        // ignore: unnecessary_nullable_for_final_variable_declarations
        final DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2022),
          lastDate: DateTime(now.year + 10),
          builder: (context, child) {
            return Theme(
              data: ThemeData().copyWith(
                colorScheme: const ColorScheme.dark(
                    onPrimary: Colors.black, // selected text color
                    onSurface: Colors.amberAccent, // default text color
                    primary: Colors.amberAccent // circle color
                    ),
                dialogBackgroundColor: Colors.black54,
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                    primary: Colors.amber, // color of button's letters
                    backgroundColor: Colors.black54, // Background color
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              //),
              child: child!,
            );
          },
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
