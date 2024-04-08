import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/routes/app_router.gr.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../components/fields/password_field.dart';
import '../../../components/widgets/snack_bars.dart';
import '../../../constants/colors.dart';

@RoutePage()
class ForgotPasswordRecoverPage extends StatefulWidget {
  const ForgotPasswordRecoverPage({ super.key});

  @override
  State<ForgotPasswordRecoverPage> createState() => _ForgotPasswordRecoverPageState();
}

class _ForgotPasswordRecoverPageState extends State<ForgotPasswordRecoverPage> {

  final TextEditingController _confirmPasswordTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
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
    _confirmPasswordTextController.dispose();
    _passwordTextController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      builder: (BuildContext context, state) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 44.0, left: 16, right: 16, bottom: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Crafting your shield",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Create a robust new password to keep your digital world secure and your information guarded. Your fortress, your rules.",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).dividerColor),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                        "New password",
                        style: Theme.of(context).textTheme.titleMedium
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    PasswordField(controller: _passwordTextController, focusNode: _focusNode,),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                        "Confirm new password",
                        style: Theme.of(context).textTheme.titleMedium
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    PasswordField(controller: _confirmPasswordTextController),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: kPrimary500,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        width: MediaQuery.sizeOf(context).width,
                        height: 50,
                        child: context.read<UserBloc>().state.maybeWhen(
                          recovering: () => const Center(child: SizedBox(height: 20, width:20, child:  CircularProgressIndicator(color: kNeutralWhite,))),
                          orElse: () => TextButton(
                            onPressed: () {
                              //context.router.push(const LoginRoute());
                              if(_passwordTextController.text == _confirmPasswordTextController.text) {
                                _formKey.currentState!.validate()
                                    ? context.read<UserBloc>().recoverPassword(
                                    token: context.read<UserBloc>().resetToken,
                                    password: _passwordTextController.text,
                                    passwordConfirm: _confirmPasswordTextController.text) : onInvalidInput(context);
                              } else {
                                onDoesntMatch(context);
                              }
                            },
                            child: Text("Done", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14,color: kNeutral100),),
                          ),)
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      listener: (BuildContext context, UserState state) {
        state.whenOrNull(
            recovered: () => {
              onSuccessState(context, "recover your password, please proceed with login 👤"),
              context.router.push(const LoginRoute())}
        );
      },
    );
  }
}
