import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/components/fields/name_field.dart';
import 'package:pomo/blocs/user/user_bloc.dart';
import 'package:pomo/i18n/strings.g.dart';
import 'package:pomo/extension/sized_box_extension.dart';
class DebouncedUserSearch extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;

  const DebouncedUserSearch({
    super.key,
    required this.controller,
    this.focusNode,
  });

  @override
  DebouncedUserSearchState createState() => DebouncedUserSearchState();
}

class DebouncedUserSearchState extends State<DebouncedUserSearch> {
  Timer? _debounce;
  bool _showFeedback = false; // Track if feedback should be shown

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String? query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Only show feedback after typing starts
    if (query != null && query.isNotEmpty) {
      setState(() {
        _showFeedback = false;
      });
    }

    // Set debounce for username search
    _debounce = Timer(const Duration(seconds: 1), () {
      if (query != null && query.length > 3) {
        context.read<UserBloc>().searchUsername(username: query);
        setState(() {
          _showFeedback = true; // Show feedback once debounce completes
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Username",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Gap.XS,
        NameField(
          hintText: t.general.username,
          controller: widget.controller,
          onChanged: _onSearchChanged,
          focusNode: widget.focusNode,
        ),
        // Show feedback only if user has typed enough characters and debounce completed
        if (_showFeedback && widget.controller.text.length > 3) ...[
          Gap.SM,
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {

              print("state.searchedUsername == widget.controller.text : ${state.searchedUsername?.replaceAll('"', '') == widget.controller.text}");
              print("state.searchedUsername  : ${state.searchedUsername?.replaceAll('"', '')}");
              print("widget.controller.text  : ${widget.controller.text}");

              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap.SM_H,
                  state.isLoading
                      ? CircularProgressIndicator(
                    color: Theme.of(context).dividerColor,
                  )
                      : Icon(
                    Icons.verified_outlined,
                    color: state.isLoading
                        ? Theme.of(context).dividerColor
                        : state.searchedUsername?.replaceAll('"', '').trim().toLowerCase() == widget.controller.text.trim().toLowerCase()
                        ? Theme.of(context).colorScheme.error
                        : Theme.of(context).primaryColor,
                    size: 20,
                  ),
                  Gap.SM_H,
                  Text(
                    state.isLoading
                        ? "${t.general.loading} ..."
                        : state.searchedUsername?.replaceAll('"', '').trim().toLowerCase() == widget.controller.text.trim().toLowerCase()
                        ? t.authentication.signup.unavailable_username
                        : t.authentication.signup.available_username,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: state.isLoading
                          ? Theme.of(context).dividerColor
                          : state.searchedUsername?.replaceAll('"', '').trim().toLowerCase() == widget.controller.text.trim().toLowerCase()
                          ? Theme.of(context).colorScheme.error
                          : Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ],
    );
  }
}
