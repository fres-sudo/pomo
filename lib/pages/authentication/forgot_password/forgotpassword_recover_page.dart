import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/fields/password_text_field.dart';
import '../../../components/widgets/rounded_button.dart';
import '../../../constants/colors.dart';
import '../login_in/login_page.dart';

@RoutePage()
class ForgotPasswordRecoverPage extends StatefulWidget {
  const ForgotPasswordRecoverPage({ super.key});

  @override
  State<ForgotPasswordRecoverPage> createState() => _ForgotPasswordRecoverPageState();
}

class _ForgotPasswordRecoverPageState extends State<ForgotPasswordRecoverPage> {

  final TextEditingController _confirmPasswordTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  final bool _checkedValue = false;

  @override
  void dispose() {
    _confirmPasswordTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 44.0, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Crafting your shield",
                      style: Theme.of(context).textTheme.headlineMedium
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Create a robust new password to keep your digital world secure and your information guarded. Your fortress, your rules.",
                      style: Theme.of(context).textTheme.bodyMedium
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Password",
                      style: Theme.of(context).textTheme.titleMedium
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    PasswordField(controller: _passwordTextController),
                    const SizedBox(
                      height: 28,
                    ),
                    Text(
                      "Confirm new password",
                      style: Theme.of(context).textTheme.titleMedium
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    PasswordField(controller: _confirmPasswordTextController),
                  ],
                ),

              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: RoundedButton(
                    color: kPrimary500,
                    borderColor: Colors.transparent,
                    child: Text(
                      "Done",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: kNeutral50,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                        PageRouteBuilder(
                          pageBuilder: (c, a1, a2) =>
                          const LoginPage(),
                          transitionsBuilder:
                              (c, anim, a2, child) =>
                              FadeTransition(
                                  opacity: anim,
                                  child: child),
                          transitionDuration:
                          const Duration(milliseconds: 300),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
