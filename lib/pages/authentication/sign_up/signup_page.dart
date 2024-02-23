import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/routes/app_router.gr.dart';
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
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = false;

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
                      color: kPastelYellow.withOpacity(0.50),
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
                      Text("Welcome",
                          style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(
                        height: 4,
                      ),
                      Text("Create your account.",
                          style: Theme.of(context).textTheme.bodyMedium),
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
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Username",
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: _usernameTextController,
                          cursorColor: kPrimary600,
                          decoration: const InputDecoration(
                            hintText: "Username",
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp('[ ]')),
                          ],
                          style: Theme.of(context).textTheme.titleMedium,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 3) {
                              return 'Please enter a valid username';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text("Email",
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailTextController,
                          cursorColor: kPrimary600,
                          decoration: const InputDecoration(
                            hintText: "Email",
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp('[ ]')),
                          ],
                          style: Theme.of(context).textTheme.titleMedium,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !EmailValidator.validate(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text("Password",
                            style: Theme.of(context).textTheme.titleMedium),
                        const SizedBox(
                          height: 6,
                        ),
                        TextFormField(
                          obscureText: _obscureText,
                          controller: _passwordTextController,
                          cursorColor: kPrimary600,
                          decoration: InputDecoration(
                              hintText: "Email",
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                child: _obscureText
                                    ? const Icon(
                                        Icons.visibility_outlined,
                                      )
                                    : const Icon(Icons.visibility_off_outlined),
                              )),
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp('[ ]')),
                          ],
                          style: Theme.of(context).textTheme.titleMedium,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 7) {
                              return 'Please enter a valid password';
                            }
                            return null;
                          },
                        ),
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
                                      color: kNeutral900),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 20,
                        ),
                        RoundedButton(
                            borderColor: Colors.transparent,
                            color: kPrimary500,
                            onPressed: () async {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (!_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                      content: Text('Please enter valid information')),
                                );
                              }
                            },
                            child: Text(
                              "Sign up",
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: kNeutral50),
                            )),
                      ],
                    ),
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
                            fontWeight: FontWeight.w500, color: kNeutral900),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushRoute(LoginRoute());
                        },
                        child: Text(
                          "Log in",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500, color: kPrimary500),
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
