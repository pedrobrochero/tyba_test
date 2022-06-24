import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/control_classes/status.dart';
import '../../../../core/control_classes/usecase.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_session_data.dart';
import '../../domain/usecases/login_with_google.dart';
import '../../domain/usecases/logout.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._loginWGoogleUsecase, this._logoutUsecase,
      this._getSessionDataUsecase)
      : super(const AuthState()) {
    _getInitialData();
  }

  final LoginWGoogle _loginWGoogleUsecase;
  final Logout _logoutUsecase;
  final GetSessionData _getSessionDataUsecase;

  void _getInitialData() async {
    emit(state.copyWith(status: const Status.loading()));
    final result = await _getSessionDataUsecase.call(NoParams());
    result.fold(
      (l) => emit(state.copyWith(
        status: const Status.error(),
        sessionData: null,
      )),
      (r) => emit(state.copyWith(
        status: const Status.loaded(),
        sessionData: r,
      )),
    );
  }

  void login() async {
    emit(state.copyWith(status: const Status.loading()));
    final result = await _loginWGoogleUsecase.call(NoParams());
    result.fold(
      (l) => emit(state.copyWith(
        status: const Status.error(),
        sessionData: null,
      )),
      (r) => emit(state.copyWith(
        status: const Status.loaded(),
        sessionData: r,
      )),
    );
  }

  void logout() {
    _logoutUsecase.call(NoParams());
    emit(state.copyWith(sessionData: null, status: const Status.loaded()));
  }
}
