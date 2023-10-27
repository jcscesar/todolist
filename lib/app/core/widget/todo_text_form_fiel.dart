import 'package:flutter/material.dart';
import 'package:todolist/app/core/ui/todolisticon_icons.dart';

class TodoTextFormFiel extends StatelessWidget {
  final String? label;
  final bool obscureText;
  final IconButton? suffixIconButton;
  final ValueNotifier<bool> obscureTextVelueNotifier;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  TodoTextFormFiel({
    Key? key,
    required this.label,
    this.obscureText = false,
    this.suffixIconButton,
    this.controller,
    this.validator,
  })  : assert(obscureText == true ? suffixIconButton == null : true,
            'obscureText não pode ser enviado em conjunto com suffixIconButton'),
        obscureTextVelueNotifier = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: obscureTextVelueNotifier,
        builder: (_, obscureTextValue, cuild) {
          return SizedBox(
            child: TextFormField(
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                labelText: label,
                suffixIcon: suffixIconButton ??
                    (obscureText == true
                        ? IconButton(
                            onPressed: () {
                              obscureTextVelueNotifier.value =
                                  !obscureTextValue;
                            },
                            icon: Icon(
                              !obscureTextValue
                                  ? Todolisticon.eye_slash
                                  : Todolisticon.eye,
                              size: 15,
                            ),
                          )
                        : null),
              ),
              obscureText: obscureTextValue,
            ),
          );
        });
  }
}
