import 'package:example_project/domain/model/dto/profile_dto.dart';
import 'package:example_project/domain/model/profile.dart';

abstract class ProfileRepository {
  Future<Profile?> updateProfile(ProfileDTO profile);
}