import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:todolist/app/core/messages/messages.dart';
import 'package:todolist/app/core/notifier/default_change_notifier.dart';

class DefaultListenerNotifier {
  final DefaultChangeNotifier defaultChangeNotifier;

  DefaultListenerNotifier({
    required this.defaultChangeNotifier,
  });

  void listener({
    required BuildContext context,
    required SuccessVoidCallback successVoidCallback,
    ErrorVoidCallback? errorVoidCallback,
  }) {
    defaultChangeNotifier.addListener(() {
      if (defaultChangeNotifier.loading) {
        Loader.show(context);
      } else {
        Loader.hide();
      }
      if (defaultChangeNotifier.hasError) {
        if (errorVoidCallback != null) {
          errorVoidCallback(defaultChangeNotifier, this);
        }
        Messages.of(context).showError(
          defaultChangeNotifier.error ?? 'message',
        );
      } else if (defaultChangeNotifier.isSuccess) {
        Messages.of(context).showSuccess(
          'Sucess',
        );
        successVoidCallback(defaultChangeNotifier, this);
      }
    });
  }

  void dispose() {
    defaultChangeNotifier.removeListener(() {});
  }
}

typedef SuccessVoidCallback = void Function(
  DefaultChangeNotifier notifier,
  DefaultListenerNotifier listenerNotifier,
);

typedef ErrorVoidCallback = void Function(
  DefaultChangeNotifier notifier,
  DefaultListenerNotifier listenerNotifier,
);
