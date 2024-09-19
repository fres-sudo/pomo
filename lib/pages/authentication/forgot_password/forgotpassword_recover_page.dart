import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/routes/app_router.gr.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../components/fields/password_field.dart';
import '../../../components/widgets/snack_bars.dart';
import '../../../constants/colors.dart';
import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';

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
                        t.authentication.forgot_password.change_password,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600)
                    ),
                    Gap.XS,
                    Text(
                      t.authentication.forgot_password.description_change_password,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).dividerColor),
                    ),
                    Gap.XL,
                    Text(
                        t.authentication.forgot_password.new_password,
                        style: Theme.of(context).textTheme.titleMedium
                    ),
                    Gap.SM,
                    PasswordField(controller: _passwordTextController, focusNode: _focusNode,),
                    Gap.MD,
                    Text(
                        t.authentication.forgot_password.confirm_password,
                        style: Theme.of(context).textTheme.titleMedium
                    ),
                    Gap.XS,
                    PasswordField(controller: _confirmPasswordTextController),
                    Gap.XL,
                    ElevatedButton(onPressed: (){
                      context.router.push(const LoginRoute());
                      /*if(_passwordTextController.text == _confirmPasswordTextController.text) {
                                _formKey.currentState!.validate()
                                    ? context.read<UserBloc>().recoverPassword(
                                    token: context.read<UserBloc>().resetToken,
                                    password: _passwordTextController.text,
                                    passwordConfirm: _confirmPasswordTextController.text) : onInvalidInput(context);
                              } else {
                                onDoesntMatch(context);
                              }*/
                    }, child: Center(
                      child: Text(t.general.done, style: Theme.of(context).textTheme.titleMedium,),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      listener: (BuildContext context, UserState state) {
        /*state.whenOrNull(
            recovered: () => {
              onSuccessState(context, "recover your password, please proceed with login 👤"),
              context.router.push(const LoginRoute())}
        );*/
      },
    );
  }
}
