import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/pages/profile/widget/theme_mode_switcher.dart';

import '../../constants/colors.dart';
import '../../constants/text.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Account", style: kSerzif(context)),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 17),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 10),
                    ],
                  ),
                  child: Row(children: [
                    const CircleAvatar(),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Josh Newman",
                          style: kSubtitle2(context),
                        ),
                        Text(
                          "@josh",
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: kNeutral600,
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    color: kNeutral200,
                  ),
                ),
                Text(
                  "General",
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: kNeutral600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: (){},
                    borderRadius: BorderRadius.circular(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Notification", style: kSubtitle2(context),),
                      SvgPicture.asset("assets/icons/arrow-right.svg", height: 18,)
                    ],
                  )
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){},
                    borderRadius: BorderRadius.circular(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Languages", style: kSubtitle2(context),),
                      SvgPicture.asset("assets/icons/arrow-right.svg", height: 18,)
                    ],
                  )
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: (){
                      Scaffold.of(context).showBottomSheet(
                            (BuildContext context) {
                          return const ThemeModeSwitcher();
                        },
                      );

                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Theme Mode", style: kSubtitle2(context),),
                        SvgPicture.asset("assets/icons/arrow-right.svg", height: 18,)
                      ],
                    )
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    color: kNeutral200,
                  ),
                ),
                Text(
                  "About us",
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: kNeutral600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                    onTap: (){},
                    borderRadius: BorderRadius.circular(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Help Center", style: kSubtitle2(context),),
                        SvgPicture.asset("assets/icons/arrow-right.svg", height: 18,)
                      ],
                    )
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: (){},
                    borderRadius: BorderRadius.circular(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Privacy Policy", style: kSubtitle2(context),),
                        SvgPicture.asset("assets/icons/arrow-right.svg", height: 18,)
                      ],
                    )
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: (){

                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Text("Logout", style: GoogleFonts.inter(
                      color: kRed600,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
