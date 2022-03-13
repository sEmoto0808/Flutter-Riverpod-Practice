import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/main.dart';
import 'package:flutter_riverpod_practice/state/login_state.dart';
import 'package:flutter_riverpod_practice/state/user_entity.dart';

/// ログイン画面
class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text('Email'),
            TextField(),
            const SizedBox(height: 25),
            const Text('Password'),
            TextField(),
            const SizedBox(height: 25),
            Align(
              child: TextButton(
                onPressed: () {
                  ref.watch(userProvider.notifier).state =
                      const UserEntity('User1');
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
