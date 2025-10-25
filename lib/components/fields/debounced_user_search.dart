import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/components/fields/name_field.dart';
import 'package:pomo/blocs/user/user_bloc.dart';
import 'package:pomo/components/utils/custom_circular_progress_indicator.dart';
import 'package:pomo/i18n/strings.g.dart';
import 'package:pomo/extension/sized_box_extension.dart';

enum DebounceState { idle, loading, success, error }

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
  DebounceState _debounceState = DebounceState.idle;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String? query) {
    _debounce?.cancel();
    setState(() {
      _debounceState = DebounceState.loading;
    });
    _debounce = Timer(const Duration(seconds: 1), () {
      if (query != null && query.length > 3) {
        context.read<UserBloc>().searchUsername(username: query);
      } else {
        setState(() {
          _debounceState = DebounceState.idle;
        });
      }
    });
  }

  void _updateValidationState(BuildContext context, UserState state) {
    final isUsernameAvailable =
        state.searchedUsername?.replaceAll('"', '').trim().toLowerCase() !=
            widget.controller.text.trim().toLowerCase();

    setState(() {
      if (state.isLoading) {
        _debounceState = DebounceState.loading;
      } else if (isUsernameAvailable ||
          widget.controller.text != state.user?.username) {
        _debounceState = DebounceState.success;
      } else {
        _debounceState = DebounceState.error;
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
        if (widget.controller.text.length > 3) ...[
          Gap.SM,
          _buildSearchResult(context),
        ],
      ],
    );
  }

  Widget _buildSearchResult(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _updateValidationState(context, state);
        });

        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap.SM_H,
            _debounceState == DebounceState.loading ||
                    _debounceState == DebounceState.idle
                ? LoadingSpinner(color: Theme.of(context).dividerColor)
                : Icon(
                    Icons.verified_outlined,
                    color: _debounceState == DebounceState.success
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.error,
                    size: 20,
                  ),
            Gap.SM_H,
            Text(
              _debounceState == DebounceState.loading ||
                      _debounceState == DebounceState.idle
                  ? "${t.general.loading} ..."
                  : _debounceState == DebounceState.success
                      ? t.authentication.signup.available_username
                      : t.authentication.signup.unavailable_username,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: _debounceState == DebounceState.success
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.error,
                  ),
            ),
          ],
        );
      },
    );
  }
}
