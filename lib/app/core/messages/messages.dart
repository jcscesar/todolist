import 'package:flutter/material.dart';
import 'package:todolist/app/core/ui/theme_extensions.dart';

class Messages {
  final BuildContext context;
  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void showError(String message) => _showMessage(
        message,
        context.errorColor,
      );

  void showSuccess(String message) => _showMessage(
        message,
        context.primaryColor,
      );

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  void showInfo(String infMenssage) => _showMessage(
        infMenssage,
        context.infoColor,
      );
}
