import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../cubit/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlutterLogo(
              size: min(size.width * .6, size.height * .6),
            ),
            const SizedBox(height: 32),
            OutlinedButton(
                onPressed: context.read<AuthCubit>().login,
                child: Text(S.of(context).loginWGoogle)),
          ],
        ),
      ),
    );
  }
}
