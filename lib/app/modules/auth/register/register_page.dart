import 'package:flutter/material.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';
import 'package:todolist/app/core/widget/todo_list_logo.dart';
import 'package:todolist/app/core/widget/todo_text_form_fiel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todo List',
              style: TextStyle(fontSize: 10, color: context.primaryColor),
            ),
            Text(
              'Cadastro',
              style: TextStyle(fontSize: 15, color: context.primaryColor),
            ),
          ],
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
              child: TodoListLogo(),
              fit: BoxFit.fitHeight,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Form(
                child: Column(
              children: [
                TodoTextFormFiel(label: 'E-mail'),
                const SizedBox(
                  height: 20,
                ),
                TodoTextFormFiel(
                  label: 'Senha',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                TodoTextFormFiel(
                  label: 'Confirma Senha',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {},
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
