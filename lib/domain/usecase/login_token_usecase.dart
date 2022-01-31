import 'package:example_project/domain/model/dto/profile_dto.dart';
import 'package:example_project/domain/model/failure.dart';
import 'package:example_project/domain/model/profile.dart';
import 'package:example_project/domain/model/success.dart';
import 'package:example_project/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'async_usecase.dart';

class LoginTokenUseCase extends AsyncUseCase {
  final AuthRepository _authRepository;

  LoginTokenUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Failure, Profile?>> execute({ProfileDTO? profileDTO}) async {
    try {
      Profile? response = await _authRepository.loginToken(profileDTO!);
      return Right(response);
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      return Left(Failure(message: "SendCodeUseCase error", exception: "$error", stackTrace: stackTrace));
    }
  }
}
