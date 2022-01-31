import 'package:json_annotation/json_annotation.dart';

part 'profile_dto.g.dart';

@JsonSerializable()
class ProfileDTO {
  final String? firstName;
  final String? lastName;
  final String? patronymic;
  final String? name;
  final String? email;
  final String? phone;
  final String? birthday;
  final String token;

  ProfileDTO({
    this.firstName,
    this.lastName,
    this.patronymic,
    this.name,
    this.email,
    this.birthday,
    required this.token,
    this.phone
  });

  factory ProfileDTO.fromJson(Map<String, dynamic> json) => _$ProfileDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDTOToJson(this);

}
