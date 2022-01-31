import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  final int id;
  final String firstName;
  final String lastName;
  final String patronymic;
  final String name;
  final String email;
  final String phone;
  final String birthday;
  final int verify;
  final String token;
  final bool isNewRecord;
  final List<Gifts> gifts;

  Profile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.patronymic,
    required this.name,
    required this.email,
    required this.birthday,
    required this.verify,
    required this.token,
    required this.isNewRecord,
    required this.gifts,
    required this.phone
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

}

@JsonSerializable()
class Gifts {
  final int id;
  final String name;
  final String image;
  final String note;

  Gifts({
    required this.id,
    required this.name,
    required this.note,
    required this.image,
  });

  factory Gifts.fromJson(Map<String, dynamic> json) => _$GiftsFromJson(json);

  Map<String, dynamic> toJson() => _$GiftsToJson(this);
}
