import 'package:carpeta_ciudadana/features/file/presentation/bloc/file_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:carpeta_ciudadana/core/theme/app_theme.dart';
import 'package:carpeta_ciudadana/core/router/app_routes.dart';
import 'package:carpeta_ciudadana/features/register/presentation/bloc/register_bloc.dart';
import 'package:carpeta_ciudadana/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:carpeta_ciudadana/core/di/dependency_injector.dart';

class AppState extends StatelessWidget {
  final InjectionContainerImpl injectionContainerImpl;

  const AppState({
    super.key,
    required this.injectionContainerImpl,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInBloc>(
          create: (context) => injectionContainerImpl.sl<SignInBloc>(),
        ),
        BlocProvider<RegisterBloc>(
          create: (context) => injectionContainerImpl.sl<RegisterBloc>(),
        ),
        BlocProvider<FileBloc>(
          create: (context) => injectionContainerImpl.sl<FileBloc>(),
        ),
      ],
      child: const MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Carpeta Ciudadana',
      theme: AppTheme.ligthTheme,
    );
  }
}
