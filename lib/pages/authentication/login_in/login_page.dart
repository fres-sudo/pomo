import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/components/fields/email_text_field.dart';
import 'package:pomo/components/fields/password_text_field.dart';
import 'package:pomo/components/widgets/rounded_button.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/routes/app_router.gr.dart';


@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  bool _checkedValue = false;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return Scaffold(
      backgroundColor: kNeutralBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 1 / 4,
                  decoration: BoxDecoration(
                      color: kPastelPurple,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome back!",
                        style: kHeadingH2(context),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Enter your email & password for logging in ",
                        style: kBody2(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: kSubtitle2(context),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  EmailField(controller: _emailTextController),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Password",
                    style: kSubtitle2(context),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  PasswordField(controller: _passwordTextController),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            splashRadius: 3,
                            value: _checkedValue,
                            onChanged: (newValue) {
                              setState(() {
                                _checkedValue = newValue!;
                              });
                            },
                          ),
                          Text(
                            "Remember me",
                            style: GoogleFonts.inter(
                              fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: kNeutral900
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          context.pushRoute(const ForgotPasswordRoute());
                        },
                        child: Text(
                          "Forgot password?",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: kPrimary500
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height:10,
                  ),
                  const Divider(
                    color: kNeutral200,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundedButton(
                    borderColor: kNeutral200,
                      width: MediaQuery.sizeOf(context).width,
                      onPressed: (){},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/icons/google-logo.svg"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("Continue with Google", style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: kNeutral900
                            ),)
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 45,
                  ),
                  RoundedButton(
                    borderColor: Colors.transparent,
                      color: kPrimary500,
                      onPressed: () async {


                      },
                      child: Text("Log in",
                        style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: kNeutral50
                        ),
                      )
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            color: kNeutral900
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: (){
                          context.pushRoute(const SignUpRoute());
                        },
                        child: Text(
                          "Sign up",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: kPrimary500
                          ),
                        ),
                      )
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
