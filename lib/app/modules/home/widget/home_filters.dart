import 'package:flutter/material.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';
import 'package:todolist/app/modules/home/widget/home_card_filter.dart';

class HomeFilters extends StatefulWidget {
  const HomeFilters({Key? key}) : super(key: key);

  @override
  State<HomeFilters> createState() => _HomeFiltersState();
}

class _HomeFiltersState extends State<HomeFilters> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filtros',
          style: context.titleStyle,
        ),
        const SizedBox(height: 10),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HomeCardFilter(),
              HomeCardFilter(),
              HomeCardFilter(),
              HomeCardFilter(),
            ],
          ),
        )
      ],
    );
  }
}
