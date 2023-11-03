import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/app/core/auth/auth_provider.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Selector<AuthProvider, String>(
            selector: (context, authProvider) =>
                authProvider.user?.displayName ?? 'Não informado',
            builder: (context, value, child) {
              return Text(
                'E ai, $value',
                style: context.textTheme.headlineSmall,
              );
            },
          ),
        )
      ],
    );
  }
}
