import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class MyProgressIndicator extends StatelessWidget {
  const MyProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 3.4,
          ),
          const CircularProgressIndicator(
            color: kPrimary500,
          ),
        ]);
  }
}
