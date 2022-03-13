import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_practice/main.dart';
import 'package:flutter_riverpod_practice/state/login_state.dart';
import 'package:flutter_riverpod_practice/state/user_entity.dart';

/// ログイン画面
class LoginPage extends ConsumerWidget {
  LoginPage({Key? key}) : super(key: key);

  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailError = ref.watch(emailErrorProvider);
    final passwordError = ref.watch(passwordErrorProvider);

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
            TextField(
              controller: _emailTextController,
              onSubmitted: (emailInput) {
                ref.watch(emailProvider.notifier).state = emailInput;
              },
            ),
            Visibility(
              visible: emailError.isNotEmpty,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child: Text(
                emailError,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.redAccent),
              ),
            ),
            const SizedBox(height: 25),
            const Text('Password'),
            TextField(
              controller: _passwordTextController,
              onSubmitted: (passwordInput) {
                ref.watch(passwordProvider.notifier).state = passwordInput;
              },
            ),
            Visibility(
              visible: passwordError.isNotEmpty,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child: Text(
                passwordError,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    ?.copyWith(color: Colors.redAccent),
              ),
            ),
            const SizedBox(height: 25),
            Align(
              child: TextButton(
                onPressed: () {
                  if (!canLogin()) return;

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

  bool canLogin() =>
      _emailTextController.text.isNotEmpty &&
      _passwordTextController.text.isNotEmpty;
}
