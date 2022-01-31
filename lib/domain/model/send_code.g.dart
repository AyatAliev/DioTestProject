// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendCode _$SendCodeFromJson(Map<String, dynamic> json) => SendCode(
      login: json['login'] as String,
      type: json['type'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$SendCodeToJson(SendCode instance) => <String, dynamic>{
      'login': instance.login,
      'type': instance.type,
      'code': instance.code,
    };
