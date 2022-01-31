import 'package:example_project/data/remote/data_source.dart';
import 'package:example_project/domain/model/dto/profile_dto.dart';
import 'package:example_project/domain/model/profile.dart';
import 'package:example_project/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {

  final DataSource _dataSource;

  ProfileRepositoryImpl({
    required DataSource dataSource,
  })  : _dataSource = dataSource;

  @override
  Future<Profile?> updateProfile(ProfileDTO profile) {
    return _dataSource.updateProfile(profile);
  }

}