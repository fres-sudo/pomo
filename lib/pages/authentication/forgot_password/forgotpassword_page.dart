import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pomo/components/fields/email_field.dart';
import 'package:pomo/routes/app_router.gr.dart';

import '../../../blocs/user/user_bloc.dart';
import '../../../components/widgets/snack_bars.dart';
import '../../../constants/colors.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (BuildContext context, UserState state) {
        state.whenOrNull(
          fetchedOTP: (response) => {
                  onEmailSent(context),
                  context.router.push(
                      ForgotPasswordOTPRoute(email: _emailTextController.text)),
                });
      },
      builder: (BuildContext context, UserState state) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 44.0, left: 16, right: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.router.pop();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/arrow-left.svg',
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).iconTheme.color!,
                              BlendMode.srcIn),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                          "Reset Your Password",
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Renew your access with a password reset – safeguarding your account with simplicity and peace of mind",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).dividerColor),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                      "Email",
                      style: Theme.of(context).textTheme.titleMedium
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  EmailField(controller: _emailTextController, focusNode: _focusNode,),
                  const Spacer(),
                  Container(
                      decoration: BoxDecoration(
                          color: kPrimary500,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      width: MediaQuery.sizeOf(context).width,
                      height: 50,
                      child: context.read<UserBloc>().state.maybeWhen(
                        fetchingOTP: () => const Center(child: SizedBox(height: 20, width:20, child:  CircularProgressIndicator(color: kNeutralWhite,))),
                        orElse: () => TextButton(
                          onPressed: () {
                            //context.router.push( ForgotPasswordOTPRoute(email: _emailTextController.text, otp: "123456" ));
                            _formKey.currentState!.validate() ? context.read<UserBloc>().forgotPassword(email: _emailTextController.text) : onInvalidInput(context);
                          },
                          child: Text("Send Email", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14,color: kNeutral100),),
                        ),)
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
