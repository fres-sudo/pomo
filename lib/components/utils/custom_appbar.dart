import 'package:flutter/material.dart';
import '../../constants/text.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  const CustomAppBar({
    super.key,
    required this.height,
    required this.text
  });

  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 60, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text, style: kSerzif(context)),
          const SizedBox(
            height: 20,
          ),
        ],
      )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}