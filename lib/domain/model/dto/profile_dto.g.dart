// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDTO _$ProfileDTOFromJson(Map<String, dynamic> json) => ProfileDTO(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      patronymic: json['patronymic'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      birthday: json['birthday'] as String?,
      token: json['token'] as String,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ProfileDTOToJson(ProfileDTO instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'patronymic': instance.patronymic,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'token': instance.token,
    };
