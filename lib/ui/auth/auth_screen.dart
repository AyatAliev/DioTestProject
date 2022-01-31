import 'package:example_project/domain/model/profile.dart';
import 'package:example_project/domain/model/send_code.dart';
import 'package:example_project/domain/model/success.dart';
import 'package:example_project/domain/usecase/confirm_code_usecase.dart';
import 'package:example_project/domain/usecase/login_token_usecase.dart';
import 'package:example_project/domain/usecase/send_code_usecase.dart';
import 'package:example_project/ui/auth/auth_bloc.dart';
import 'package:example_project/ui/profile/profile_screen.dart';
import 'package:example_project/ui/widget/box_code_field.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  static const String routeName = "auth";

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthBloc>(
          create: (context) => AuthBloc(
              context: context,
              sendCodeUseCase: GetIt.I<SendCodeUseCase>(),
              confirmCodeUseCase: GetIt.I<ConfirmCodeUseCase>(),
              loginTokenUseCase: GetIt.I<LoginTokenUseCase>()),
          dispose: (context, authBloc) => authBloc.dispose(),
        ),
      ],
      child: Consumer<AuthBloc>(
        builder: (context, authBloc, child) {
          return Scaffold(
            body: SafeArea(
              child: StreamBuilder<Profile?>(
                  stream: authBloc.tokenStream,
                  builder: (context, data) {
                    return StreamBuilder<Success>(
                        stream: authBloc.sendCodeStream,
                        builder: (context, data) {
                          if (data.data == null) {
                            return CustomScrollView(
                              physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                              slivers: [
                                SliverToBoxAdapter(
                                  child: Container(
                                      height: 200,
                                      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                                      child: Lottie.asset("assets/lottie_email.json")),
                                ),
                                SliverToBoxAdapter(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                    alignment: Alignment.bottomCenter,
                                    child: TextFormField(
                                      controller: authBloc.loginController,
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                ),
                                SliverToBoxAdapter(
                                  child: GestureDetector(
                                    onTap: () {
                                      authBloc.sendCode(SendCode(login: authBloc.loginController.text, type: "email"));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                      padding: const EdgeInsets.symmetric(vertical: 16),
                                      color: Colors.amberAccent,
                                      alignment: Alignment.bottomCenter,
                                      child: const Text("Выслать код"),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }

                          authBloc.boxFocusNode.requestFocus();
                          return CustomScrollView(
                            physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                            slivers: [
                              SliverToBoxAdapter(
                                child: Container(
                                    height: 200,
                                    margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                                    child: Lottie.asset("assets/lottie_email.json")),
                              ),
                              SliverToBoxAdapter(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                  alignment: Alignment.bottomCenter,
                                  child: PinCodeFields(
                                    length: 6,
                                    fieldBorderStyle: FieldBorderStyle.Square,
                                    responsive: false,
                                    fieldHeight: 35.0,
                                    fieldWidth: 35.0,
                                    borderWidth: 1.0,
                                    animationCurve: Curves.easeInOut,
                                    switchInAnimationCurve: Curves.easeIn,
                                    switchOutAnimationCurve: Curves.easeOut,
                                    animation: Animations.SlideInDown,
                                    controller: authBloc.boxController,
                                    focusNode: authBloc.boxFocusNode,
                                    borderRadius: BorderRadius.circular(10.0),
                                    keyboardType: TextInputType.number,
                                    autoHideKeyboard: false,
                                    fieldBackgroundColor: Colors.black12,
                                    borderColor: Colors.black38,
                                    textStyle: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    onComplete: (value) async {
                                      Profile? profile = await authBloc
                                          .confirmCode(SendCode(login: authBloc.loginController.text, code: value));

                                      if (profile != null) {
                                        authBloc.boxFocusNode.canRequestFocus = false;
                                        Navigator.pushNamed(context, ProfileScreen.routeName,
                                            arguments: ProfileArguments(profile));
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  }),
            ),
          );
        },
      ),
    );
  }
}
