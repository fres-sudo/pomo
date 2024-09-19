import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/constants/colors.dart';
import 'package:pomo/pages/root_page.dart';

import '../../../blocs/user/user_bloc.dart';
import '../../../components/fields/email_field.dart';
import '../../../extension/sized_box_extension.dart';
import '../../../i18n/strings.g.dart';
import '../../../models/user/user.dart';
import '../../../routes/app_router.gr.dart';

@RoutePage()
class ChooseUsernamePage extends StatefulWidget {
  const ChooseUsernamePage({super.key, required this.user});

  final User user;

  @override
  State<ChooseUsernamePage> createState() => _ChooseUsernamePageState();
}

class _ChooseUsernamePageState extends State<ChooseUsernamePage> {

  final TextEditingController _usernameTextController = TextEditingController();
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
    _usernameTextController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (BuildContext context, UserState state) => !state.isLoading && state.operation == UserOperation.updated ? context.router.replace(const RootRoute()) : null,
      builder: (BuildContext context, UserState state) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 44.0, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    t.authentication.signup.choose_username,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600)
                ),
                Gap.XS,
                Text(
                  t.authentication.signup.choose_username_description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).dividerColor),
                ),
                Gap.XL,
                Text(
                    "Username",
                    style: Theme.of(context).textTheme.titleMedium
                ),
                Gap.XS,
                EmailField(controller: _usernameTextController, focusNode: _focusNode,),
                const Spacer(),
                ElevatedButton(
                    onPressed: () => _usernameTextController.text.length > 3 ? context.read<UserBloc>().updateUser(id: widget.user.id, user: widget.user.copyWith(username: _usernameTextController.text) ) : null,
                    child: state.isLoading ? const CircularProgressIndicator() : Center(
                        child: Text(t.general.continue_title, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: kNeutralWhite,
                        )))),
                Gap.SM,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
