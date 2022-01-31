import 'package:example_project/domain/model/profile.dart';
import 'package:example_project/domain/usecase/update_profile_usecase.dart';
import 'package:example_project/ui/profile/profile_bloc.dart';
import 'package:example_project/ui/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileArguments arguments = ModalRoute.of(context)?.settings.arguments as ProfileArguments;

    return MultiProvider(
      providers: [
        Provider<ProfileBloc>(
          create: (context) => ProfileBloc(
            arguments: arguments,
            updateProfileUseCase: GetIt.I<UpdateProfileUseCase>(),
          ),
          dispose: (context, profileBloc) => profileBloc.dispose(),
        ),
      ],
      child: Consumer<ProfileBloc>(
        builder: (context, profileBloc, child) {
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: CustomTextField(
                        controller: profileBloc.nameController,
                        hintText: 'Name',
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: CustomTextField(
                        controller: profileBloc.emailNameController,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: CustomTextField(
                        controller: profileBloc.phoneNameController,
                        hintText: 'Phone',
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: GestureDetector(
                      onTap: () {
                        profileBloc.update();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        color: Colors.amberAccent,
                        alignment: Alignment.bottomCenter,
                        child: const Text("Сохранить"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfileArguments {
  final Profile profile;

  ProfileArguments(this.profile);
}
