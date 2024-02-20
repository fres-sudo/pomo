import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/fields/email_text_field.dart';
import '../../../components/fields/name_text_field.dart';
import '../../../components/fields/password_text_field.dart';
import '../../../components/widgets/rounded_button.dart';
import '../../../constants/colors.dart';
import '../../../constants/text.dart';


@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  bool _checkedValue = false;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _usernameTextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
                  decoration: const BoxDecoration(
                      color: kPastelYellow,
                      borderRadius: BorderRadius.only(
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
                        "Welcome",
                        style: kHeadingH2(context),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Create your account.",
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
                    "Username",
                    style: kSubtitle2(context),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  NameField(controller: _usernameTextController),
                  const SizedBox(
                    height: 18,
                  ),
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
                    height: 24,
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
                            "I accept terms & conditions",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: kNeutral900
                            ),
                          ),
                        ],
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
                      borderColor: Colors.transparent,
                      color: kPrimary500, onPressed: () async {
                        },
                      child: Text("Sign up",
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
                        "Already have an account?",
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

                        },
                        child: Text(
                          "Log in",
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
