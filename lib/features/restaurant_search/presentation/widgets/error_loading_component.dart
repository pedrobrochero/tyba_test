import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class ErrorLoadingComponent extends StatelessWidget {
  const ErrorLoadingComponent({Key? key, this.message, this.onRetryPressed})
      : super(key: key);
  final VoidCallback? onRetryPressed;
  final String? message;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          message ?? S.of(context).anErrorHasOcurred,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(height: 16),
        if (onRetryPressed != null)
          OutlinedButton.icon(
            label: Text(S.of(context).retry),
            icon: const Icon(Icons.refresh),
            onPressed: onRetryPressed,
          )
      ]),
    );
  }
}
