import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/blocs/sign_in/sign_in_bloc.dart';
import 'package:pomo/components/fields/email_text_field.dart';
import 'package:pomo/components/fields/password_text_field.dart';
import 'package:pomo/components/widgets/rounded_button.dart';
import 'package:pomo/constants/colors.dart';
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
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = false;
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
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (BuildContext context, state) => state.whenOrNull(
        errorSignIn: () => _onErrorSignIn(context),
        signedIn: (_) => AutoRouter.of(context).replace(const RootRoute()),
      ),
      builder: (BuildContext context, SignInState state) {
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
                          Text("Welcome back!",
                              style: Theme.of(context).textTheme.headlineMedium),
                          const SizedBox(
                            height: 4,
                          ),
                          Text("Enter your email & password for logging in ",
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
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email",
                                  style: Theme.of(context).textTheme.titleMedium),
                              const SizedBox(
                                height: 6,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailTextController,
                                cursorColor: kPrimary600,
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
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
                                autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    hintText: "Password",
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
                                          : const Icon(
                                          Icons.visibility_off_outlined),
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
                                        style:
                                        Theme.of(context).textTheme.titleSmall,
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .pushRoute(const ForgotPasswordRoute());
                                    },
                                    child: Text(
                                      "Forgot password?",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                          color: kPrimary400),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),

                              RoundedButton(
                                  borderColor: Colors.transparent,
                                  color: kPrimary500,
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<SignInBloc>().perform(
                                          email: _emailTextController.text,
                                          password: _passwordTextController.text);
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                            content: Text('Please enter valid information')),
                                      );
                                    }
                                  } ,
                                  child: Text(
                                    "Log in",
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: kNeutral50),
                                  ))
                            ]),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            child: Divider(),
                            width: MediaQuery.sizeOf(context).width / 2.6,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              "or",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          SizedBox(
                            child: Divider(),
                            width: MediaQuery.sizeOf(context).width / 2.6,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      RoundedButton(
                          borderColor: kNeutral200,
                          width: MediaQuery.sizeOf(context).width,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset("assets/icons/google-logo.svg"),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Continue with Google",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: kNeutral900),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedButton(
                          borderColor: kNeutral200,
                          width: MediaQuery.sizeOf(context).width,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/icons/apple-logo.png",
                                  width: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Continue with Apple",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: kNeutral900),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              context.pushRoute(const SignUpRoute());
                            },
                            child: Text(
                              "Sign up",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(color: kPrimary400),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}

_onErrorSignIn(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        content: Text('Something went wrong with login, please try again')),
  );
}
