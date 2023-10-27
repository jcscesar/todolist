import 'package:firebase_auth/firebase_auth.dart';
import 'package:todolist/app/core/exception/auth_exceptions.dart';

import 'package:todolist/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCredencial = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredencial.user;
    } on FirebaseAuthException catch (e, s) {
      if (e.code == 'email-already-exists') {
        final loginTypes =
            await _firebaseAuth.fetchSignInMethodsForEmail(email);
        if (loginTypes.contains('password')) {
          throw AuthExceptions(
            message: 'E-mail já utilizado, por favor escolha outro e-mail',
          );
        } else {
          throw AuthExceptions(
            message:
                'Você se cadastrou no TodoList pelo Google, por favor utilize ele para entrar!!',
          );
        }
      } else {
        throw AuthExceptions(
          message: e.message ?? 'Error ao registrar usuário',
        );
      }
    }
  }
}
