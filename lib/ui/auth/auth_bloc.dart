import 'package:example_project/data/local/hive_helper.dart';
import 'package:example_project/domain/model/dto/profile_dto.dart';
import 'package:example_project/domain/model/profile.dart';
import 'package:example_project/domain/model/send_code.dart';
import 'package:example_project/domain/model/success.dart';
import 'package:example_project/domain/usecase/confirm_code_usecase.dart';
import 'package:example_project/domain/usecase/login_token_usecase.dart';
import 'package:example_project/domain/usecase/send_code_usecase.dart';
import 'package:example_project/ui/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc {
  final SendCodeUseCase _sendCodeUseCase;
  final ConfirmCodeUseCase _confirmCodeUseCase;
  final LoginTokenUseCase _loginTokenUseCase;

  // Subjects
  final BehaviorSubject<Success> _sendCodeSubject;
  final BehaviorSubject<Profile?> _tokenSubject;

  // Controllers
  final TextEditingController loginController;
  final TextEditingController boxController;

  // FocusNodes
  final FocusNode boxFocusNode;

  final BuildContext context;

  AuthBloc(
      {required SendCodeUseCase sendCodeUseCase,
      required ConfirmCodeUseCase confirmCodeUseCase,
      required LoginTokenUseCase loginTokenUseCase,
      required this.context})
      : _sendCodeUseCase = sendCodeUseCase,
        _confirmCodeUseCase = confirmCodeUseCase,
        _loginTokenUseCase = loginTokenUseCase,
        _sendCodeSubject = BehaviorSubject(),
        _tokenSubject = BehaviorSubject(),
        loginController = TextEditingController(),
        boxController = TextEditingController(),
        boxFocusNode = FocusNode() {
    token();
  }

  Stream<Success> get sendCodeStream => _sendCodeSubject.stream;

  Stream<Profile?> get tokenStream => _tokenSubject.stream;

  Future<void> sendCode(SendCode sendCode) async {
    (await _sendCodeUseCase.execute(sendCode: sendCode)).fold((l) {}, (r) {
      if (r != null) {
        _sendCodeSubject.value = r;
      }
    });
  }

  Future<Profile?> confirmCode(SendCode sendCode) async {
    return (await _confirmCodeUseCase.execute(sendCode: sendCode)).fold(
      (l) => null,
      (right) => right,
    );
  }

  Future<void> token() async {
    final path = await getApplicationDocumentsDirectory();
    Hive.init(path.path);
    await Hive.openBox('appMetrics');

    HiveHelper.tokenBox = await Hive.openBox<String>('token');

    if (HiveHelper.token != null) {
      loginToken();
    }
  }

  Future<void> loginToken() async {
    (await _loginTokenUseCase.execute(profileDTO: ProfileDTO(token: HiveHelper.token!))).fold((l) => null, (r) {
      _tokenSubject.value = r;
      if(r != null) {
        Navigator.pushNamed(context, ProfileScreen.routeName, arguments: ProfileArguments(r));
      }
    });
  }

  void dispose() {
    // FocusNodes
    boxFocusNode.dispose();

    // Controllers
    loginController.dispose();
    boxController.dispose();

    // Subjects
    _sendCodeSubject.close();
    _tokenSubject.close();
  }
}
