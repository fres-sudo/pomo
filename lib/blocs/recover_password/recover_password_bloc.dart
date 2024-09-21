import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pomo/error/auth_error.dart';
import 'package:pomo/error/localized.dart';
import 'package:pomo/repositories/authentication_repository.dart';

part 'recover_password_bloc.freezed.dart';

part 'recover_password_event.dart';

part 'recover_password_state.dart';

/// The RecoverPasswordBloc
class RecoverPasswordBloc extends Bloc<RecoverPasswordEvent, RecoverPasswordState> {
  final AuthenticationRepository authenticationRepository;

  /// Create a new instance of [RecoverPasswordBloc].
  RecoverPasswordBloc(this.authenticationRepository) : super(const RecoverPasswordState.none()) {
    on<ForgotPasswordRecoverPasswordEvent>(_onForgotPassword);
    on<VerifyTokenRecoverPasswordEvent>(_onVerifyToken);
    on<ResetPasswordRecoverPasswordEvent>(_onResetPassword);
  }

  /// Method used to add the [ForgotPasswordRecoverPasswordEvent] event
  void forgotPassword({required String email}) => add(RecoverPasswordEvent.forgotPassword(email: email));

  /// Method used to add the [VerifyTokenRecoverPasswordEvent] event
  void verifyToken({required String email, required String token}) => add(RecoverPasswordEvent.verifyToken(email: email, token: token));

  /// Method used to add the [ResetPasswordRecoverPasswordEvent] event
  void resetPassword({required String email, required String token, required String newPassword, required String confirmNewPassword}) =>
      add(RecoverPasswordEvent.resetPassword(email: email, token: token, confirmNewPassword: confirmNewPassword, newPassword: newPassword));

  FutureOr<void> _onForgotPassword(
    ForgotPasswordRecoverPasswordEvent event,
    Emitter<RecoverPasswordState> emit,
  ) async {
    emit(const RecoverPasswordState.forgottingPassword());
    try {
      await authenticationRepository.forgotPassword(email: event.email);
      emit(const RecoverPasswordState.forgottedPassword());
    } on DioException catch (error) {
      emit(RecoverPasswordState.errorForgottingPassword(ForgotPasswordError(error.response?.data ?? "")));
    } catch (_) {
      emit(RecoverPasswordState.errorForgottingPassword(ForgotPasswordError('')));
    }
  }

  FutureOr<void> _onVerifyToken(
    VerifyTokenRecoverPasswordEvent event,
    Emitter<RecoverPasswordState> emit,
  ) async {
    emit(const RecoverPasswordState.verifyingToken());
    try {
      await authenticationRepository.verifyToken(token: event.token, email: event.email);
      emit(const RecoverPasswordState.verifiedToken());
    } on DioException catch (error) {
      emit(RecoverPasswordState.errorVerifyingToken(VerifyTokenError(error.response?.data ?? "")));
    } catch (_) {
      emit(RecoverPasswordState.errorVerifyingToken(VerifyTokenError('')));
    }
  }

  FutureOr<void> _onResetPassword(
    ResetPasswordRecoverPasswordEvent event,
    Emitter<RecoverPasswordState> emit,
  ) async {
    emit(const RecoverPasswordState.resettingPassword());
    try {
      await authenticationRepository.resetPassword(
          email: event.email, token: event.token, newPassword: event.newPassword, confirmNewPassword: event.confirmNewPassword);
      emit(const RecoverPasswordState.resettedPassword());
    } on DioException catch (error) {
      emit(RecoverPasswordState.errorResettingPassword(ResetPasswordError(error.response?.data ?? "")));
    } catch (_) {
      emit(RecoverPasswordState.errorResettingPassword(ResetPasswordError('')));
    }
  }
}
