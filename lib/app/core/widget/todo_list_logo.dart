import 'package:flutter/material.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';

class TodoListLogo extends StatelessWidget {
  const TodoListLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 200,
        ),
        Text(
          'Todo List',
          style: context.textTheme.headlineSmall,
        )
      ],
    );
  }
}
