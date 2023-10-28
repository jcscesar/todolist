import 'package:flutter/material.dart';

class DefaultChangeNotifier extends ChangeNotifier {
  bool _loanding = false;
  bool _success = false;
  String? _error;

  String? get error => _error;
  bool get loading => _loanding;
  bool get hasError => _error != null;
  bool get isSuccess => _success;

  void showLoading() => _loanding = true;
  void hideLoading() => _loanding = false;
  void success() => _success = true;
  void setError(String? error) => _error = error;
  void showLoadingAndResetState() {
    showLoading();
    resetState();
  }

  void resetState() {
    setError(null);
    _success = false;
  }
}
