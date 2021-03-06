import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/login_page.dart';
import 'package:flutter_riverpod_practice/provider/app_name_provider.dart';
import 'package:flutter_riverpod_practice/provider/counter_provider.dart';
import 'package:flutter_riverpod_practice/state/user_entity.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: user == null ? LoginPage() : const MyHomePage(),
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appName = ref.watch(appNameProvider);
    final user = ref.watch(userProvider);

    final count = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User Name: ' + (user?.name ?? '')),
            Text(count.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.watch(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
