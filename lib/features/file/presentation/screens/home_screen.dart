import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:carpeta_ciudadana/core/constants/router_paths.dart';
import 'package:carpeta_ciudadana/features/signin/presentation/bloc/sign_in_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Carpeta ciudadana'),
          actions: [
            BlocConsumer<SignInBloc, SignInState>(
              listener: (context, state) {
                if (state is SignOutState) {
                  context.go(RouterPaths.login);
                }
              },
              builder: (context, state) {
                if (state is SignedInUserState) {
                  return IconButton(
                    onPressed: () {
                      context.read<SignInBloc>().add(SignOutUserEvent(
                            token: state.token,
                          ));
                    },
                    icon: Icon(Icons.logout_rounded),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
        body: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) {
            if (state is SignedInUserState) {
              return SafeArea(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: size.height * 0.015),
                  child: Center(
                    child: Container(
                      height: size.height * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit_document),
                          SizedBox(height: 20),
                          FilledButton(
                            onPressed: () {
                              context.push(RouterPaths.file_upload);
                            },
                            child: Text('Subir documentos'),
                          ),
                          SizedBox(height: 20),
                          FilledButton(
                            onPressed: () {
                              context.push(RouterPaths.files);
                            },
                            child: Text('Ver documentos'),
                          ),
                          SizedBox(height: 20),
                          FilledButton(
                            onPressed: () {
                              context.push(RouterPaths.change_operator);
                            },
                            child: Text('Cambiar de operador'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Debes hacer login primero'),
                    SizedBox(height: 10),
                    FilledButton(
                        onPressed: () {
                          context.go(RouterPaths.login);
                        },
                        child: Text('Ir a login')),
                  ],
                ),
              );
            }
          },
        ));
  }
}
