import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../constants/colors.dart';
import '../widgets/rounded_button.dart';

class CustomPopup extends StatefulWidget {
  final String title, text;

  const CustomPopup({super.key, required this.title, required this.text});

  @override
  CustomPopupState createState() => CustomPopupState();
}

class CustomPopupState extends State<CustomPopup> {
  var success = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.contains('error')) {
      success = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      width: 560,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 48,
            offset: Offset(0, 32),
          ),
          BoxShadow(
            color: Color(0x0c000000),
            blurRadius: 14,
            offset: Offset(0, 0),
          ),
        ],
        color: kNeutralWhite,
      ),
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 24,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: kNeutral900,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              widget.text,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                color: kNeutral600,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: RoundedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      width: 83,
                      border: false,
                      progressColor: kNeutralWhite,
                      color: kPrimary500,
                      child: Text("Ok",
                          style: GoogleFonts.inter(
                            color: kNeutralWhite,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomConfirmPopup extends StatefulWidget {
  final String title, text;
  final Function() yesAction;
  final Function() noAction;

  const CustomConfirmPopup(
      {super.key, required this.title, required this.text, required this.yesAction, required this.noAction});

  @override
  CustomConfirmPopupState createState() => CustomConfirmPopupState();
}

class CustomConfirmPopupState extends State<CustomConfirmPopup> {
  var success = true;

  @override
  void initState() {
    super.initState();
    if (widget.text.contains('error')) {
      success = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      width: 560,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 48,
            offset: Offset(0, 32),
          ),
          BoxShadow(
            color: Color(0x0c000000),
            blurRadius: 14,
            offset: Offset(0, 0),
          ),
        ],
        color: kNeutralWhite,
      ),
      padding: const EdgeInsets.only(
        top: 24,
        bottom: 24,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: kNeutral900,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              widget.text,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                color: kNeutral900,
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedButton(
                        onPressed: () => widget.noAction(),
                        width: 110,
                        border: false,
                        progressColor: kNeutralWhite,
                        color: kPrimary500,
                        child: Text("Exit",
                            style: GoogleFonts.inter(
                              color: kNeutralWhite,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      RoundedButton(
                        onPressed: () => widget.yesAction(),
                        width: 110,
                        border: false,
                        progressColor: kNeutralWhite,
                        color: kPrimary500,
                        child: Text("Confirm",
                            style: GoogleFonts.inter(
                              color: kNeutralWhite,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
