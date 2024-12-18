import 'package:dfunc/dfunc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_project/extensions/either_extension.dart';
import 'package:mobile_project/extensions/extension_exception.dart';
import 'package:mobile_project/features/auth/data/auth_repository.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthDataRepository _authDataRepository;
  
  AuthCubit(this._authDataRepository) : super(const AuthState());

  Future<void> getAccountInfo() async {
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _authDataRepository.getAccountInfo().toEither();
    if (result.isRight()) {
      emit(state.copyWith(status: AuthStatus.success));
    } else { 
      final errorMessage = result.getLeft()?.toMessage();
      emit(state.copyWith(status: AuthStatus.failure, error: errorMessage));
    }
  }

  Future<void> login() async{
    emit(state.copyWith(status: AuthStatus.loading));
    final result = await _authDataRepository.login(username: "username", password: "password").toEither();

    if (result.isRight()) {
      emit(state.copyWith(status: AuthStatus.success));
    } else {
      final errorMessage = result.getLeft()?.toMessage();
      emit(state.copyWith(status: AuthStatus.failure, error: errorMessage));
    }
  }
  
}
