import 'package:flutter/material.dart';
import 'package:todolist/app/modules/home/widget/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home '),
      ),
      body: Container(),
      drawer: HomeDrawer(),
    );
  }
}
