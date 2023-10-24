import 'package:flutter/material.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';

class TodoListLogo extends StatelessWidget {
  const TodoListLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 190,
        ),
        Text(
          'Todo List',
          style: context.titleStyle,
        )
      ],
    );
  }
}
