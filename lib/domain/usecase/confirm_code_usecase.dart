import 'package:example_project/domain/model/failure.dart';
import 'package:example_project/domain/model/profile.dart';
import 'package:example_project/domain/model/send_code.dart';
import 'package:example_project/domain/model/success.dart';
import 'package:example_project/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'async_usecase.dart';

class ConfirmCodeUseCase extends AsyncUseCase {
  final AuthRepository _authRepository;

  ConfirmCodeUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Failure, Profile?>> execute({SendCode? sendCode}) async {
    try {
      Profile? response = await _authRepository.confirmCode(sendCode!);
      return Right(response);
    } catch (error, stackTrace) {
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      return Left(Failure(message: "ConfirmCodeUseCase error", exception: "$error", stackTrace: stackTrace));
    }
  }
}
