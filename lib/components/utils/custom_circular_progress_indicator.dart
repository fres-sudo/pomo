import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 21,
            height: 21,
            child: CircularProgressIndicator.adaptive(
              backgroundColor: color ?? Theme.of(context).colorScheme.surface,
            )));
  }
}
