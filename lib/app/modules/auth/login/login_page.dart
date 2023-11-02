import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/core/messages/messages.dart';
import 'package:todolist/app/core/notifier/default_listener_notifier.dart';
import 'package:todolist/app/core/ui/colors_extensions.dart';
import 'package:todolist/app/core/widget/todo_list_logo.dart';
import 'package:todolist/app/core/widget/todo_text_form_fiel.dart';
import 'package:todolist/app/modules/auth/login/login_controller.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _emailFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    DefaultListenerNotifier(
      defaultChangeNotifier: context.read<LoginController>(),
    ).listener(
      context: context,
      everVoidCallback: (notifier, listenerNotifier) {
        if (notifier is LoginController) {
          if (notifier.hasInfo) {
            Messages.of(context).showInfo(notifier.infMenssage!);
          }
        }
      },
      successVoidCallback: (notifier, listenerNotifier) {
        //Navigator.of(context).pushNamed('');
      },
    );
  }

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
                child: Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const TodoListLogo(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TodoTextFormFiel(
                                label: "E-mail",
                                controller: _emailEC,
                                focusNode: _emailFocus,
                                validator: Validatorless.multiple([
                                  Validatorless.required('E-mail obrigatório'),
                                  Validatorless.email('E-mail inválido'),
                                ]),
                              ),
                              const SizedBox(height: 20),
                              TodoTextFormFiel(
                                label: "Senha",
                                obscureText: true,
                                controller: _passwordEC,
                                validator: Validatorless.multiple([
                                  Validatorless.required('Senha obrigatório'),
                                  Validatorless.min(
                                    8,
                                    'Senha deve ter pelo menos 8 caracteres',
                                  ),
                                ]),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      if (_emailEC.text.isNotEmpty) {
                                        context
                                            .read<LoginController>()
                                            .forgotPassword(
                                              _emailEC.text,
                                            );
                                      } else {
                                        _emailFocus.requestFocus();
                                        Messages.of(context).showError(
                                          'Digite seu e-mail para recuperar a senha',
                                        );
                                      }
                                    },
                                    child: const Text('Esqueceu sua senha'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      final formValid =
                                          _formKey.currentState?.validate() ??
                                              false;
                                      if (formValid) {
                                        context.read<LoginController>().login(
                                              _emailEC.text,
                                              _passwordEC.text,
                                            );
                                      }
                                    },
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
                      Expanded(
                        flex: 0,
                        child: Container(
                          height: 10,
                        ),
                      ),
                      Expanded(
                        flex: 2,
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
                              const SizedBox(height: 10),
                              SignInButton(
                                Buttons.Google,
                                text: "Sign up with Google",
                                padding: const EdgeInsets.all(5),
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none),
                                onPressed: () {
                                  context.read<LoginController>().googleLogin();
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Não tem conta?'),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushNamed('/register');
                                    },
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
            ),
          );
        },
      ),
    );
  }
}
