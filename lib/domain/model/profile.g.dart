// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      patronymic: json['patronymic'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      birthday: json['birthday'] as String,
      verify: json['verify'] as int,
      token: json['token'] as String,
      isNewRecord: json['isNewRecord'] as bool,
      gifts: (json['gifts'] as List<dynamic>)
          .map((e) => Gifts.fromJson(e as Map<String, dynamic>))
          .toList(),
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'patronymic': instance.patronymic,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'birthday': instance.birthday,
      'verify': instance.verify,
      'token': instance.token,
      'isNewRecord': instance.isNewRecord,
      'gifts': instance.gifts,
    };

Gifts _$GiftsFromJson(Map<String, dynamic> json) => Gifts(
      id: json['id'] as int,
      name: json['name'] as String,
      note: json['note'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$GiftsToJson(Gifts instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'note': instance.note,
    };
