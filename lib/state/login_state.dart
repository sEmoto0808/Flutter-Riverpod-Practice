import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/state/user_entity.dart';

/// 擬似的にユーザーログインの状態管理をするための[Provider]を定義

/// ユーザー情報の受け渡しを行うためのProvider
final userProvider = StateProvider<UserEntity?>((ref) => null);

/// メールアドレスの受け渡しを行うためのProvider
final emailProvider = StateProvider.autoDispose((ref) {
  return '';
});

/// パスワードの受け渡しを行うためのProvider
final passwordProvider = StateProvider.autoDispose((ref) {
  return '';
});
