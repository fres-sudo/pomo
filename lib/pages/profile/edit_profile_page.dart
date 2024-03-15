import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomo/blocs/project/project_bloc.dart';
import '../../constants/colors.dart';
import '../../constants/text.dart';
import '../../cubits/auth/auth_cubit.dart';

@RoutePage()
class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _surnameTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameTextController.dispose();
    _surnameTextController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {

        },
        builder: (context, state) => Scaffold(
          body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          InkWell(
                            onTap: () {
                              AutoRouter.of(context).pop();
                            },
                            child: SvgPicture.asset(
                              'assets/icons/arrow-left.svg',
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).iconTheme.color ??
                                      Colors.white,
                                  BlendMode.srcIn),
                            ),
                          ),
                          Text(
                            "My Profile",
                            style: kSerzif(context),
                          ),
                        ]),
                        TextButton(
                            onPressed: () {
                              String id = context.read<AuthCubit>().state.maybeWhen(authenticated: (user) => user.id, orElse: () => "");
                            },
                            child: Text(
                              "Create",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: _formKey.currentState?.validate() != null ? _formKey.currentState!.validate() ? kPrimary500 : kNeutral400 : kPrimary500),
                            )),

                      ],
                    ),
                    Form(
                      key: _formKey,
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
                            controller: _nameTextController,
                            cursorColor: kPrimary600,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
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
                                  value.length > 3) {
                                return 'Please enter a valid name';
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
                            controller: _surnameTextController,
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
                            initialValue: state.maybeWhen(authenticated: (user) => user.email, orElse: () => ""),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length > 3) {
                                return 'Please enter a valid surname';
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
                            readOnly: true,
                            cursorColor: kPrimary600,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              hintText: state.maybeWhen(authenticated: (user) => user.email, orElse: () => ""),),
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
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
    );
  }
}
