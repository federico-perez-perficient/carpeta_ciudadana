import 'package:carpeta_ciudadana/core/constants/router_paths.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:carpeta_ciudadana/shared/custom_password_field.dart';
import 'package:carpeta_ciudadana/shared/custom_text_form_field.dart';
import 'package:carpeta_ciudadana/shared/custom_spinning_progress_circular_indicator.dart';
import 'package:carpeta_ciudadana/features/register/presentation/bloc/register_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
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
        } else if (state is RegisterCompletedState) {
          context.pop();
          context.go(RouterPaths.login);
        } else if (state is RegisterErrorState) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Hubo un error'),
                content: Text(state.errorMessage),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                      context.pop();
                    },
                    child: Text('Cerrar'),
                  ),
                ],
              );
            },
          );
        }
      },
      builder: (context, state) {
        if (state is RegisterInitialState ||
            state is RegisterLoadingState ||
            state is RegisterErrorState) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.03,
                    horizontal: 40,
                  ),
                  child: SizedBox(
                    width: size.width,
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  'Registrate a Carpeta Ciudadana',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ],
                        ),
                        _Form(),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Ya tienes una cuenta?',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: Colors.black54),
                            ),
                            TextButton(
                              onPressed: () {
                                if (context.canPop()) {
                                  context.pop();
                                } else {
                                  context.go(RouterPaths.login);
                                }
                              },
                              style: ButtonStyle(
                                splashFactory: NoSplash.splashFactory,
                                overlayColor: MaterialStateProperty.all(
                                  Colors.transparent,
                                ),
                              ),
                              child: Text(
                                'Ingresa a ella',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Theme.of(context).primaryColor,
                                  decorationThickness: 0.3,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .fontSize,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
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
  final personIdCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final confirmEmailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();
  final _formRegisterKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formRegisterKey,
      child: Column(
        children: [
          const Text('Cedula'),
          CustomTextFormField(
            hintText: 'Cedula',
            textController: personIdCtrl,
            prefixIconData: Icons.credit_card,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingresa tu nombre completo';
              } else {
                return null;
              }
            },
          ),
          const Text('Nombre completo'),
          CustomTextFormField(
            hintText: 'Nombre completo',
            textInputType: TextInputType.emailAddress,
            textController: nameCtrl,
            prefixIconData: Icons.person,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingresa tu nombre completo';
              } else {
                return null;
              }
            },
          ),
          const Text('Direccion'),
          CustomTextFormField(
            prefixIconData: Icons.house_rounded,
            hintText: 'Direccion',
            textInputType: TextInputType.streetAddress,
            textController: addressCtrl,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingresa tu direccion';
              } else {
                return null;
              }
            },
          ),
          const Text('Email'),
          CustomTextFormField(
            prefixIconData: Icons.email,
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
            textController: emailCtrl,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Ingresa un email';
              } else {
                return null;
              }
            },
          ),
          CustomTextFormField(
            prefixIconData: Icons.email,
            helperText: 'Email no coincide',
            hintText: 'Confirma tu email',
            textInputType: TextInputType.emailAddress,
            textController: confirmEmailCtrl,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Confirma tu email';
              }
              if (value != emailCtrl.text) {
                return 'Email no coincide';
              } else {
                return null;
              }
            },
          ),
          const Text('Clave'),
          CustomPasswordField(
            prefixIconData: Icons.lock,
            sufficIconData: Icons.remove_red_eye_rounded,
            hintText: 'Clave',
            textController: passwordCtrl,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a password';
              } else if (value.length < 8) {
                return 'More characters needed';
              } else {
                return null;
              }
            },
          ),
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: Text(
          //     'Por lo menos 8 characters',
          //     style: Theme.of(context)
          //         .textTheme
          //         .labelLarge!
          //         .copyWith(color: const Color(0xFF717171)),
          //   ),
          // ),
          CustomPasswordField(
            prefixIconData: Icons.lock,
            sufficIconData: Icons.remove_red_eye_rounded,
            hintText: 'Confirma tu clave',
            textController: confirmPasswordCtrl,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Porfavor confirma tu clave';
              }
              if (value != passwordCtrl.text) {
                return 'Claves no coinciden';
              } else {
                return null;
              }
            },
          ),
          FilledButton(
            child: Text('Registrar'),
            onPressed: () {
              if (_formRegisterKey.currentState!.validate()) {
                context.read<RegisterBloc>().add(
                      RegisterUserEvent(
                        personId: personIdCtrl.text,
                        name: nameCtrl.text,
                        address: addressCtrl.text,
                        email: confirmEmailCtrl.text,
                        password: confirmPasswordCtrl.text,
                      ),
                    );
              }
            },
          ),
        ],
      ),
    );
  }
}
