import 'package:auto_route/auto_route.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/blocs/sign_in/sign_in_bloc.dart';
import 'package:pomo/components/fields/email_field.dart';
import 'package:pomo/components/fields/password_field.dart';
import 'package:pomo/components/widgets/snack_bars.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/constants/text.dart';
import 'package:pomo/cubits/auth/auth_cubit.dart';
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

  bool _obscureText = true;

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
        errorSignIn: () => onErrorState(context, "signing in"),
        signedIn: (user) {
          context.read<AuthCubit>().authenticated(user);
          context.router.replace(const RootRoute());
        }
      ),
      builder: (BuildContext context, SignInState state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * 1 / 3.5,
                      decoration: const BoxDecoration(
                          gradient: kGradientPurple2,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 16, bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Welcome back! 🍅",
                              style: kSerzif(context)),
                          const SizedBox(
                            height: 4,
                          ),
                          Text("Enter your email & password for logging in ",
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer)),
                        ],
                      ),
                    )
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16, top: 36),
                    child: Column(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Email",
                                  style: Theme.of(context).textTheme.titleMedium),
                              const SizedBox(
                                height: 6,
                              ),
                              EmailField(controller: _emailTextController),
                              const SizedBox(
                                height: 18,
                              ),
                              Text("Password",
                                  style: Theme.of(context).textTheme.titleMedium),
                              const SizedBox(
                                height: 6,
                              ),
                              PasswordField(controller: _passwordTextController),
                              const SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
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
                                        color: kPrimary500),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ]),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: kPrimary500,
                                borderRadius: BorderRadius.circular(16)
                              ),
                              width: MediaQuery.sizeOf(context).width,
                              height: 50,
                              child: state.maybeWhen(
                                  signingIn: () => const Center(child: SizedBox(height: 20, width:20, child:  CircularProgressIndicator(color: kNeutralWhite,))),
                                  orElse: () => TextButton(
                                    onPressed: () {
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
                                    },
                                    child: Text("Login", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14,color: kNeutral100),),
                                  ),)
                            ),
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
                                        ?.copyWith(color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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

