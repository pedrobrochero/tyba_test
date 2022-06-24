import 'package:flutter/material.dart';

import '../../../auth/presentation/widgets/logout_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(actions: const [LogOutButton()]),
        body: Center(
          child: Text('$runtimeType'),
        ),
      );
}
