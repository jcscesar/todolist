// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:todolist/app/core/notifier/default_listener_notifier.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';
import 'package:todolist/app/core/widget/todo_text_form_fiel.dart';

import 'package:todolist/app/modules/tasks/tasks_controller.dart';
import 'package:todolist/app/modules/tasks/widget/calendar_button.dart';
import 'package:validatorless/validatorless.dart';

// ignore: must_be_immutable
class TasksCreatePage extends StatefulWidget {
  final TasksController _tasksController;

  const TasksCreatePage({
    Key? key,
    required TasksController tasksController,
  })  : _tasksController = tasksController,
        super(key: key);

  @override
  State<TasksCreatePage> createState() => _TasksCreatePageState();
}

class _TasksCreatePageState extends State<TasksCreatePage> {
  final _keyForm = GlobalKey<FormState>();
  final _descriptionEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    DefaultListenerNotifier(defaultChangeNotifier: widget._tasksController)
        .listener(
      context: context,
      successVoidCallback: (notifier, listenerNotifier) {
        listenerNotifier.dispose();
        Navigator.pop(context);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text('Form'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final valid = _keyForm.currentState?.validate() ?? false;
          if (valid) {
            widget._tasksController.save(_descriptionEC.text);
          }
        },
        label: const Text(
          'Salvar Task',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: _keyForm,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Criar Task',
                  style: context.titleStyle.copyWith(fontSize: 20),
                ),
              ),
              const SizedBox(height: 30),
              TodoTextFormFiel(
                label: '',
                controller: _descriptionEC,
                validator: Validatorless.required(
                  'Descrição é obrigatoria',
                ),
              ),
              const SizedBox(height: 20),
              CalendarButton(),
            ],
          ),
        ),
      ),
    );
  }
}
