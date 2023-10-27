import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';
import 'package:todolist/app/core/validator/validators.dart';
import 'package:todolist/app/core/widget/todo_list_logo.dart';
import 'package:todolist/app/core/widget/todo_text_form_fiel.dart';
import 'package:todolist/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<RegisterController>().addListener(() {
      final controller = context.read<RegisterController>();

      var success = controller.success;
      var error = controller.error;

      if (success) {
        Navigator.of(context).pop();
      } else if (error != null && error.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
    // context.read<RegisterController>().addListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Container(
          padding: EdgeInsets.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Todo List',
                style: TextStyle(
                  fontSize: 10,
                  color: context.primaryColor,
                ),
              ),
              Text(
                'Cadastro ',
                style: TextStyle(
                  fontSize: 15,
                  color: context.primaryColor,
                ),
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: ClipOval(
            child: Container(
              color: context.primaryColor.withAlpha(20),
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 20,
                color: context.primaryColor,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.zero,
            height: MediaQuery.of(context).size.width * .5,
            child: const FittedBox(
              // ignore: sort_child_properties_last
              child: TodoListLogo(),
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TodoTextFormFiel(
                      label: 'E-mail',
                      controller: _emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('E-mail obrigatório'),
                        Validatorless.email('E-mail inválido'),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TodoTextFormFiel(
                      label: 'Senha',
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
                    const SizedBox(
                      height: 20,
                    ),
                    TodoTextFormFiel(
                      label: 'Confirma Senha',
                      obscureText: true,
                      controller: _confirmPasswordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha obrigatório'),
                        Validators.compare(
                          _passwordEC,
                          'Senha diferente de confirma senha',
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          final formValid =
                              _formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            context.read<RegisterController>().registerUser(
                                  _emailEC.text,
                                  _passwordEC.text,
                                );
                          }
                        },
                        child: const Text('Salvar'),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
