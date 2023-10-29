import 'package:todolist/app/core/exception/auth_exceptions.dart';
import 'package:todolist/app/core/notifier/default_change_notifier.dart';
import 'package:todolist/app/services/user/user_service.dart';

class LoginController extends DefaultChangeNotifier {
  final UserService _userService;
  String? infMenssage;

  LoginController({required UserService userService})
      : _userService = userService;

  bool get hasInfo => infMenssage != null;

  Future<void> login(String email, String password) async {
    try {
      showLoadingAndResetState();
      infMenssage = null;
      notifyListeners();
      final user = await _userService.login(email, password);
      if (user != null) {
        success();
      } else {
        setError('Usuário ou senha inválidos');
      }
    } on AuthExceptions catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      showLoadingAndResetState();
      infMenssage = null;
      notifyListeners();
      await _userService.forgotPassword(email);
      infMenssage = 'Reset de senha enviado para seu e-mail';
    } catch (_) {
      setError('Error ao resetar a senha');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
