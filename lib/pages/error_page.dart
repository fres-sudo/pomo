import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/constants/colors.dart';
import 'package:tap_debouncer/tap_debouncer.dart';

@RoutePage()
class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.title, required this.description, required this.image});
  final String title;
  final String description;
  final String image;
  //PageModel errorModel = PageModel.none;

  @override
  Widget build(BuildContext context) {
    Orientation currentOrientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (currentOrientation == Orientation.portrait)
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.20,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 13),
                    blurRadius: 60,
                    color: kPrimary500.withOpacity(0.17),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      title,
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      description,
                      style: GoogleFonts.inter(
                        color: Colors.black38,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 36,
                    decoration: const BoxDecoration(
                      color: kPrimary500,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    child: TapDebouncer(
                      onTap: () async {
                        /* errorModel = PageModel.none;
                        final hasNetwork = await NetworkProvider().hasNetwork();
                        if (!hasNetwork) {
                          errorModel = PageModel.network;
                        }
                        switch (errorModel) {
                          case PageModel.noAuth:
                            return;
                          case PageModel.network:
                            return;
                          case PageModel.server:
                            return;
                          case PageModel.user:
                            return;
                          case PageModel.none:
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (c, a1, a2) => const LaunchApp(),
                                transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                transitionDuration: const Duration(milliseconds: 500),
                              ),
                            );
                        }*/
                      },
                      builder: (BuildContext context, TapDebouncerFunc? onTap) {
                        return Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: onTap,
                            child: onTap == null
                                ? null
                                : const Center(
                              child: Text(
                                "AGGIORNA",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        );
                      },
                      waitBuilder: (_, Widget child) {
                        return Stack(
                          children: <Widget>[
                            child,
                            const Center(
                                child: SizedBox(
                                    height: 15.0,
                                    width: 15.0,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ))),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
