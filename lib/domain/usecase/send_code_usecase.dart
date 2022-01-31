import 'package:example_project/domain/model/failure.dart';
import 'package:example_project/domain/model/send_code.dart';
import 'package:example_project/domain/model/success.dart';
import 'package:example_project/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'async_usecase.dart';

class SendCodeUseCase extends AsyncUseCase {
  final AuthRepository _authRepository;

  SendCodeUseCase({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Either<Failure, Success?>> execute({SendCode? sendCode}) async {
    try {
      Success? response = await _authRepository.sendCode(sendCode!);
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
