// ignore_for_file: unused_catch_stack

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todolist/app/core/exception/auth_exceptions.dart';

import 'package:todolist/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _firebaseAuth;

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
      if (e.code == 'email-already-in-use') {
        if (_firebaseAuth.currentUser?.email == email) {
          throw AuthExceptions(
            message: 'E-mail já utilizado, por favor escolha outro e-mail',
          );
        } else {
          throw AuthExceptions(
            message:
                'Você se cadastrou no TodoList pelo Google, por favor utilize ele para entrar!!',
          );
        }
      } else if (e.code == 'wrong-password' || e.code == 'user-not-found') {
        throw AuthExceptions(
          message: 'Login ou senha inválidos',
        );
      } else {
        throw AuthExceptions(
          message: e.message ?? 'Error ao registrar usuário',
        );
      }
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on PlatformException catch (e, s) {
      throw AuthExceptions(message: e.message ?? 'Error ao realizar login');
    } on FirebaseAuthException catch (e, s) {
      if (e.code == 'wrong-password' ||
          // ignore: unrelated_type_equality_checks
          e.credential == 'INVALID_LOGIN_CREDENTIALS' ||
          e.code == 'user-not-found') {
        throw AuthExceptions(
          message: e.message ?? 'Error ao realizar login',
        );
      } else {
        throw AuthExceptions(
          message: e.message ?? 'Error ao realizar login',
        );
      }
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    try {
      final loginMethods = await _firebaseAuth.fetchSignInMethodsForEmail(
        email,
      );
      if (loginMethods.isEmpty) {
        await _firebaseAuth.sendPasswordResetEmail(email: email);
      } else {
        throw AuthExceptions(
          message:
              'Cadastro realizado com o goolge, não pode ser restado a senha',
        );
      }
    } on FirebaseAuthException catch (e, s) {
      throw AuthExceptions(
        message: 'Error ao restada a senha',
      );
    }
  }

  @override
  Future<User?> googleLogin() async {
    final googleSignIn = GoogleSignIn();
    List<String>? loginMethods;
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        loginMethods = await _firebaseAuth.fetchSignInMethodsForEmail(
          googleUser.email,
        );

        // ignore: unrelated_type_equality_checks
        if (loginMethods.isNotEmpty == []) {
          throw AuthExceptions(
            message:
                'Você utilizou o e-mail para cadastrar no TodoList, caso tenha esquecido sua senha por favor, click no link esqueceu sua senha',
          );
        } else {
          final googleAuth = await googleUser.authentication;
          final firebaseCredencial = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          var userCredencial = await _firebaseAuth.signInWithCredential(
            firebaseCredencial,
          );
          return userCredencial.user;
        }
      }
    } on FirebaseAuthException catch (e, s) {
      if (e.code == 'account-exists-wiyh-different-credential') {
        throw AuthExceptions(
          message:
              'Login inválido você se registrou no TodoList com os seguintes provedores: ${loginMethods?.join(',')}',
        );
      } else {
        throw AuthExceptions(
          message: 'Error ao realizar o login',
        );
      }
    } finally {}
    return null;
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    _firebaseAuth.signOut();
  }
}
