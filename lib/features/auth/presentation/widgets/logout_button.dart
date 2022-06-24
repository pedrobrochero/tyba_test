import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../cubit/auth_cubit.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => TextButton.icon(
      style: TextButton.styleFrom(
          primary: Theme.of(context).colorScheme.onPrimary),
      label: Text(S.of(context).logout),
      onPressed: context.read<AuthCubit>().logout,
      icon: const Icon(Icons.exit_to_app));
}
