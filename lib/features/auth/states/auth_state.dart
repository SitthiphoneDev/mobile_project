
part of 'auth_cubit.dart';
enum AuthStatus { initial, loading, success , failure}

@freezed
class AuthState with _$AuthState{
  const factory AuthState({
    @Default(AuthStatus.initial)
    AuthStatus status,
    String? error,
   }) = _AuthState;
}