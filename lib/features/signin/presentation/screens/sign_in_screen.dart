import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:carpeta_ciudadana/shared/custom_password_field.dart';
import 'package:carpeta_ciudadana/shared/custom_text_form_field.dart';
import 'package:carpeta_ciudadana/shared/custom_spinning_progress_circular_indicator.dart';
import 'package:carpeta_ciudadana/core/constants/router_paths.dart';
import 'package:carpeta_ciudadana/features/signin/presentation/bloc/sign_in_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Orientation orientation = MediaQuery.of(context).orientation;
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                content: Center(
                  child: CustomSpinningCircularProgressIndicator(),
                ),
                surfaceTintColor: Colors.transparent,
              );
            },
          );
        } else if (state is SignInErrorState) {
          context.pop();
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('There was an error'),
                content: Text(state.errorMessage),
              );
            },
          );
        } else if (state is SignedInUserState) {
          context.pop();
          context.go(RouterPaths.home);
        }
      },
      builder: (context, state) {
        if (state is SignInInitialState ||
            state is SignInLoadingState ||
            state is SignInErrorState) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: size.height * 0.015),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Carpeta Ciudadana',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Text(
                        "Ingreso",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    _Form(),
                    SizedBox(
                      height: (orientation == Orientation.portrait) ? 90 : 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No tienes cuenta?',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.black54),
                        ),
                        TextButton(
                          onPressed: () {
                            context.push(RouterPaths.register);
                          },
                          style: ButtonStyle(
                            splashFactory: NoSplash.splashFactory,
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: Text(
                            'Registrate',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: Theme.of(context).primaryColor,
                              decorationThickness: 0.3,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .fontSize,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final emailCtrl = TextEditingController();

  final passCtrl = TextEditingController();

  final _signInFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Form(
        key: _signInFormKey,
        child: Column(
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              buildWhen: (previous, current) {
                return previous != current;
              },
              builder: (context, state) {
                return CustomTextFormField(
                  prefixIconData: Icons.email,
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                  textController: emailCtrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Porfavor ingresa un email';
                    }
                    if (RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                    ).hasMatch(value)) {
                      return null;
                    } else {
                      return 'Email no valido';
                    }
                  },
                );
              },
            ),
            CustomPasswordField(
              prefixIconData: Icons.lock,
              sufficIconData: Icons.remove_red_eye_rounded,
              hintText: 'Clave',
              textController: passCtrl,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresa tu clave';
                } else {
                  return null;
                }
              },
            ),
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: GestureDetector(
            //     onTap: () {
            //       // context.push('');
            //     },
            //     child: Text(
            //       'Forgot your password?',
            //       style: TextStyle(
            //         color: Colors.black45,
            //         decoration: TextDecoration.underline,
            //         decorationColor: Colors.black45,
            //         decorationThickness: 0.3,
            //         fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
            //         fontWeight:
            //             Theme.of(context).textTheme.labelLarge!.fontWeight,
            //       ),
            //     ),
            //   ),
            // ),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return FilledButton(
                    onPressed: null,
                    child: Text('Ingresar'),
                  );
                } else {
                  return FilledButton(
                    onPressed: () {
                      if (_signInFormKey.currentState!.validate()) {
                        context.read<SignInBloc>().add(
                              SignInUserEvent(
                                email: emailCtrl.text,
                                password: passCtrl.text,
                              ),
                            );
                      }
                    },
                    child: Text('Ingresar'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
