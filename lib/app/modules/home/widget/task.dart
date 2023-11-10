import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';
import 'package:todolist/app/models/task_model.dart';
import 'package:todolist/app/modules/home/home_controller.dart';

class Task extends StatelessWidget {
  final TaskModel model;
  final dataFormat = DateFormat('dd/MM/yy');
  Task({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.3,
        dragDismissible: true,
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(50),
            label: "Excluir",
            foregroundColor: Colors.white,
            onPressed: (_) {},
            icon: Icons.delete,
            backgroundColor: context.errorColor,
          )
        ],
      ),
      child: Card(
        shadowColor: context.primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.primaryColorLight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 3,
        child: IntrinsicHeight(
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            leading: Checkbox(
              value: model.finished,
              onChanged: (value) =>
                  context.read<HomeController>().checkOrUnCheckTask(model),
            ),
            title: Text(
              model.description,
              style: TextStyle(
                decoration: model.finished ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text(
              dataFormat.format(model.dateTime),
              style: TextStyle(
                decoration: model.finished ? TextDecoration.lineThrough : null,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
