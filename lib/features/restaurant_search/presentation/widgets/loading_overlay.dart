import 'package:flutter/material.dart';

class LoadingOverlayComponent extends StatelessWidget {
  const LoadingOverlayComponent({
    required this.child,
    required this.isLoading,
    Key? key,
    this.loadingMessage,
  }) : super(key: key);
  final String? loadingMessage;
  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          child,
          if (isLoading)
            SizedBox.expand(
              child: Container(
                color: Colors.black87,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        loadingMessage ?? 'Por favor espere...',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 32),
                      const CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
            ),
        ],
      );
}
