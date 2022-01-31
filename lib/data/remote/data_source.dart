import 'package:example_project/domain/model/dto/profile_dto.dart';
import 'package:example_project/domain/model/profile.dart';
import 'package:example_project/domain/model/send_code.dart';
import 'package:example_project/domain/model/success.dart';

abstract class DataSource {
  Future<Success?> sendCode(SendCode sendCode);
  Future<Profile?> confirmCode(SendCode sendCode);
  Future<Profile?> updateProfile(ProfileDTO profileDTO);
  Future<Profile?> loginToken(ProfileDTO profileDTO);
}