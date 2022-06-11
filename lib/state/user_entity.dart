import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ユーザー情報の受け渡しを行うためのProvider
final userProvider = StateProvider<UserEntity?>((ref) => null);

/// ユーザー情報を保持するエンティティクラス
class UserEntity {
  final String name;

  const UserEntity(this.name);
}
