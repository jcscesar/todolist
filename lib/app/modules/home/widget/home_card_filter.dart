import 'package:flutter/material.dart';
import 'package:todolist/app/core/ui/colors_extensions.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';

class HomeCardFilter extends StatefulWidget {
  const HomeCardFilter({Key? key}) : super(key: key);

  @override
  State<HomeCardFilter> createState() => _HomeCardFilterState();
}

class _HomeCardFilterState extends State<HomeCardFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 120,
        maxWidth: 150,
      ),
      decoration: BoxDecoration(
        color: context.primaryColor,
        border: Border.all(
          width: 1,
          color: ColorsExtensions().cinza.withOpacity(.8),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: 21,
          //   width: 21,
          //   child: CircularProgressIndicator(),
          // ),
          Text(
            '10 TASKS',
            style: context.titleStyle.copyWith(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          // ),
          Text(
            'HOJE',
            style: context.titleStyle.copyWith(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          LinearProgressIndicator(
            value: 0.4,
            valueColor: const AlwaysStoppedAnimation<Color>(
              Colors.white,
            ),
            backgroundColor: context.primaryColorLight,
          ),
        ],
      ),
    );
  }
}
