import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/widgets/rounded_button.dart';
import 'package:pomo/components/widgets/top_bottom_sheet_widget.dart';

import '../../constants/colors.dart';
import '../../extension/sized_box_extension.dart';

class DestructionBottomSheet extends StatelessWidget {
  const DestructionBottomSheet({super.key, required this.title, required this.buttonText, required this.description, required this.function});

  final String title;
  final String buttonText;
  final String description;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        boxShadow: const [
          BoxShadow(color: Colors.black12, spreadRadius: 1000, blurRadius: 100),
        ],
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
      ),
      padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TopBottomSheetWidget(),
          Gap.MD,
          Text(title, style: Theme.of(context).textTheme.titleMedium ),
          Gap.XS,
          Text(description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.secondary) ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error
            ),
            onPressed: function, child: Center(
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onError)
            ),
          ),)
        ],
      ),
    );
  }
}
