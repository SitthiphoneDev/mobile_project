// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_account_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthAccountInfoModelImpl _$$AuthAccountInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthAccountInfoModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$AuthAccountInfoModelImplToJson(
        _$AuthAccountInfoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
    };
