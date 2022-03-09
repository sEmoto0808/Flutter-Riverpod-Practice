import 'package:flutter_riverpod/flutter_riverpod.dart';

/// アプリ名を提供する[Provider]を定義
final appNameProvider = Provider((ref) => 'Riverpod Practice');

/// アプリ名を画面コンテンツに加工して提供する[Provider]を定義
final appNameBodyProvider = Provider((ref) {
  final appName = ref.watch(appNameProvider);
  return appName + ' Body Text';
});
