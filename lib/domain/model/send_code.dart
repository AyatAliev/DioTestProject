import 'package:json_annotation/json_annotation.dart';

part 'send_code.g.dart';

@JsonSerializable()
class SendCode {
  SendCode({
    required this.login,
    this.type,
    this.code,
  });

  String login;
  String? type;
  String? code;

  factory SendCode.fromJson(Map<String, dynamic> json) => _$SendCodeFromJson(json);

  Map<String, dynamic> toJson() => _$SendCodeToJson(this);

}