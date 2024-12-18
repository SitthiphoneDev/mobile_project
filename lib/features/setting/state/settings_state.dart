part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(Status.initial) Status status,
    String? errors,
  }) = _SettingsState;
}
