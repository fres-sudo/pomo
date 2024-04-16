import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/widgets/rounded_button.dart';
import '../../constants/colors.dart';

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
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).bottomSheetTheme.backgroundColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 16)),
                const SizedBox(
                  height: 4,
                ),
                Text(description,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: kNeutral600)),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
                RoundedButton(
                  progressColor: kNeutral50,
                  borderColor: Colors.transparent,
                color: kRed500,
                  onPressed: function,
                  child: Text(
                    buttonText,
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: kNeutral50),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
