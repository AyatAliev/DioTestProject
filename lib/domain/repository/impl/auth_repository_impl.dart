import 'package:example_project/data/remote/data_source.dart';
import 'package:example_project/domain/model/dto/profile_dto.dart';
import 'package:example_project/domain/model/profile.dart';
import 'package:example_project/domain/model/send_code.dart';
import 'package:example_project/domain/model/success.dart';
import '../auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {

  final DataSource _dataSource;

  AuthRepositoryImpl({
    required DataSource dataSource,
  })  : _dataSource = dataSource;

  @override
  Future<Success?> sendCode(SendCode sendCode) {
    return _dataSource.sendCode(sendCode);
  }

  @override
  Future<Profile?> confirmCode(SendCode sendCode) {
    return _dataSource.confirmCode(sendCode);
  }

  @override
  Future<Profile?> loginToken(ProfileDTO profileDTO) {
    return _dataSource.loginToken(profileDTO);
  }

}