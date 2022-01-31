import 'package:example_project/data/local/hive_helper.dart';
import 'package:example_project/domain/model/dto/profile_dto.dart';
import 'package:example_project/domain/model/profile.dart';
import 'package:example_project/domain/usecase/update_profile_usecase.dart';
import 'package:example_project/ui/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {
  final ProfileArguments arguments;

  final UpdateProfileUseCase _updateProfileUseCase;

  // Subjects
  final BehaviorSubject<Profile> _profileSubject;

  // Controllers
  final TextEditingController nameController;
  final TextEditingController emailNameController;
  final TextEditingController phoneNameController;

  ProfileBloc({required this.arguments, required UpdateProfileUseCase updateProfileUseCase})
      : _updateProfileUseCase = updateProfileUseCase,
        _profileSubject = BehaviorSubject(),
        nameController = TextEditingController(text: arguments.profile.name),
        emailNameController = TextEditingController(text: arguments.profile.email),
        phoneNameController = TextEditingController(text: arguments.profile.phone) {
    HiveHelper.addToken(arguments.profile.token);
  }

  Stream<Profile> get profileCodeStream => _profileSubject.stream;

  Future<void> update() async {
    ProfileDTO profileDTO = ProfileDTO(
        email: emailNameController.text,
        name: nameController.text,
        phone: phoneNameController.text,
        token: arguments.profile.token);

    (await _updateProfileUseCase.execute(profileDTO: profileDTO)).fold((l) {}, (r) {
      if (r != null) {
        _profileSubject.value = r;
      }
    });
  }

  void dispose() {
    // Controllers
    nameController.dispose();
    emailNameController.dispose();
    phoneNameController.dispose();
  }
}
