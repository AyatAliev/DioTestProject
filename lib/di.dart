import 'package:example_project/common/network/dio_client.dart';
import 'package:example_project/data/remote/data_source.dart';
import 'package:example_project/data/remote/impl/data_source_impl.dart';
import 'package:example_project/domain/repository/auth_repository.dart';
import 'package:example_project/domain/repository/impl/auth_repository_impl.dart';
import 'package:example_project/domain/repository/impl/profile_repository_impl.dart';
import 'package:example_project/domain/usecase/confirm_code_usecase.dart';
import 'package:example_project/domain/usecase/login_token_usecase.dart';
import 'package:example_project/domain/usecase/send_code_usecase.dart';
import 'package:example_project/domain/usecase/update_profile_usecase.dart';
import 'package:get_it/get_it.dart';

import 'domain/repository/profile_repository.dart';

Future<void> di() async {
  await common();
  await other();
}

Future<void> common() async {
  GetIt.I.registerSingleton<DioClient>(DioClient());
}

Future<void> other() async {
  /// data source
  GetIt.I.registerSingleton<DataSource>(
    DataSourceImpl(dioClient: GetIt.I<DioClient>()),
  );

  /// repository
  GetIt.I.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(dataSource: GetIt.I<DataSource>()),
  );

  GetIt.I.registerSingleton<ProfileRepository>(
    ProfileRepositoryImpl(dataSource: GetIt.I<DataSource>()),
  );

  /// use case
  GetIt.I.registerSingleton<SendCodeUseCase>(
    SendCodeUseCase(authRepository: GetIt.I<AuthRepository>()),
  );

  GetIt.I.registerSingleton<ConfirmCodeUseCase>(
    ConfirmCodeUseCase(authRepository: GetIt.I<AuthRepository>()),
  );

  GetIt.I.registerSingleton<UpdateProfileUseCase>(
    UpdateProfileUseCase(repository: GetIt.I<ProfileRepository>()),
  );

  GetIt.I.registerSingleton<LoginTokenUseCase>(
    LoginTokenUseCase(authRepository: GetIt.I<AuthRepository>()),
  );


}
