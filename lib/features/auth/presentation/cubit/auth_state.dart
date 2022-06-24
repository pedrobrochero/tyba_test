part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    User? sessionData,
    @Default(Status.initial()) Status status,
  }) = _AuthState;
  const AuthState._();

  bool get isAuthenticated => sessionData != null;
}
