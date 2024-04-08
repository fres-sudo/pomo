import 'package:flutter/material.dart';

///Widget default to show erros when cannot load image
class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.white,
      child: const Icon(Icons.error, color: Colors.red),
    );
  }
}
