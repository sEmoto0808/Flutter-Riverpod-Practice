import 'package:flutter_riverpod/flutter_riverpod.dart';

/// ボタンのクリック数を提供する[Provider]
final counterProvider = StateProvider((ref) => 0);