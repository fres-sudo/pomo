import 'package:flutter/material.dart';
import 'package:pomo/constants/colors.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 13),
                  blurRadius: 60,
                  color: kPrimary500.withValues(alpha: 0.5),
                ),
              ],
            ),
            child: Image.asset(
              "assets/images/creeper-image.png",
              height: MediaQuery.sizeOf(context).height / 4.5,
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text("👾 Ops...Error 👾",
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w800)),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "A very bad error occurred while trying to $text. \n Please consider restart the app and check your internet connection.",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
