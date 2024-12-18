import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_account_info_model.freezed.dart';
part 'auth_account_info_model.g.dart';

@freezed
class AuthAccountInfoModel with _$AuthAccountInfoModel {
  const factory AuthAccountInfoModel({
    required int id,
    required String name,
    required String username,
    required String email,
  }) = _AuthAccountInfoModel;

  factory AuthAccountInfoModel.fromJson(Map<String, dynamic> json) =>
      _$AuthAccountInfoModelFromJson(json);
} 