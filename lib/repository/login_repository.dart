import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/state/login_state.dart';
import 'package:flutter_riverpod_practice/state/user_entity.dart';

final loginRepositoryProvider =
    Provider.autoDispose((ref) => LoginRepository());

class LoginRepository {
  Future<LoginState> getUser() async {
    await Future<void>.delayed(const Duration(seconds: 1));

    final randomInt = Random().nextInt(1);
    switch (randomInt % 2) {
      case 0:
        return LoginState.success(user: const UserEntity('User1'));
      case 1:
        return LoginState.error(errorMessage: 'ログイン失敗');
      default:
        return LoginState.initialized();
    }
  }
}
