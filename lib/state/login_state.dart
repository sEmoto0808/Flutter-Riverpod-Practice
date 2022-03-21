import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/state/user_entity.dart';

/// 擬似的にユーザーログインの状態管理をするための[Provider]を定義

/// ユーザー情報の受け渡しを行うためのProvider
final userProvider = StateProvider<UserEntity?>((ref) => null);

/// メールアドレスの受け渡しを行うためのProvider
final emailProvider = StateProvider.autoDispose((ref) {
  return '';
});

/// メールアドレス(Error)の受け渡しを行うためのProvider
final emailErrorProvider = StateProvider.autoDispose((ref) {
  final email = ref.watch(emailProvider);
  if (email.isEmpty) {
    return const LoginState.error(errorMessage: 'メールアドレスを入力してください');
  }
  return const LoginState.initialized();
});

/// パスワードの受け渡しを行うためのProvider
final passwordProvider = StateProvider.autoDispose((ref) {
  return '';
});

/// パスワード(Error)の受け渡しを行うためのProvider
final passwordErrorProvider = StateProvider.autoDispose((ref) {
  final password = ref.watch(passwordProvider);
  if (password.isEmpty) {
    return const LoginState.error(errorMessage: 'パスワードを入力してください');
  }
  return const LoginState.initialized();
});

class LoginState {
  final LoginStateType type;
  final UserEntity? user;
  final String? errorMessage;

  /// LoginStateType.initialized
  const LoginState.initialized()
      : type = LoginStateType.initialized,
        user = null,
        errorMessage = null;

  /// LoginStateType.success
  const LoginState.success({required this.user})
      : type = LoginStateType.success,
        errorMessage = null;

  /// LoginStateType.error
  const LoginState.error({required this.errorMessage})
      : type = LoginStateType.error,
        user = null;
}

enum LoginStateType {
  initialized,
  success,
  error,
}
