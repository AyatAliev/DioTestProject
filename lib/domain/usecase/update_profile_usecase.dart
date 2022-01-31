import 'package:dartz/dartz.dart';
import 'package:example_project/domain/model/dto/profile_dto.dart';
import 'package:example_project/domain/model/failure.dart';
import 'package:example_project/domain/model/profile.dart';
import 'package:example_project/domain/repository/profile_repository.dart';
import 'package:flutter/foundation.dart';
import 'async_usecase.dart';

class UpdateProfileUseCase extends AsyncUseCase {
  final ProfileRepository _repository;

  UpdateProfileUseCase({
    required ProfileRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, Profile?>> execute({ProfileDTO? profileDTO}) async {
    try {
      Profile? response = await _repository.updateProfile(profileDTO!);
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
