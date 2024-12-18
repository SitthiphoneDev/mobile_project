part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(Status.initial) Status status,
    String? errors,
    File? image,
    bool? isLoading,
    String? error,
  }) = _HomeState;
}
