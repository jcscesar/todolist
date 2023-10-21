import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:todolist/app/core/ui/colors_extensions.dart';
import 'package:todolist/app/core/widget/todo_list_logo.dart';
import 'package:todolist/app/core/widget/todo_text_form_fiel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.minHeight,
                minWidth: constraints.minWidth,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const TodoListLogo(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Form(
                        child: Column(
                          children: [
                            TodoTextFormFiel(),
                            const SizedBox(height: 20),
                            TodoTextFormFiel(),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextButton(
                                  onPressed: null,
                                  child: Text('Esqueceu sua senha'),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text('Login'),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorsExtensions().expandeds,
                          border: Border(
                            top: BorderSide(
                              width: 2,
                              color: Colors.grey.withAlpha(50),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            SignInButton(
                              Buttons.Google,
                              text: "Sign up with Google",
                              padding: const EdgeInsets.all(5),
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                              onPressed: () {},
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Não tem conta?'),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Cadastre-se'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
