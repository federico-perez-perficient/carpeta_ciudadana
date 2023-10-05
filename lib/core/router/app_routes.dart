import 'package:carpeta_ciudadana/features/file/presentation/screens/read_files_screen.dart';
import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:carpeta_ciudadana/core/constants/router_paths.dart';
import 'package:carpeta_ciudadana/features/file/presentation/screens/home_screen.dart';
import 'package:carpeta_ciudadana/features/file/presentation/screens/load_file_screen.dart';
import 'package:carpeta_ciudadana/features/operator/presentation/screens/change_operator_screen.dart';
import 'package:carpeta_ciudadana/features/register/presentation/screens/register_screen.dart';
import 'package:carpeta_ciudadana/features/signin/presentation/screens/sign_in_screen.dart';

final router = GoRouter(
  initialLocation: RouterPaths.login,
  routes: [
    //SignIn
    GoRoute(
      path: RouterPaths.login,
      builder: (BuildContext context, GoRouterState state) =>
          const LoginScreen(),
    ),
    //Register
    GoRoute(
      path: RouterPaths.register,
      builder: (BuildContext context, GoRouterState state) =>
          const RegisterScreen(),
    ),
    //Operator
    GoRoute(
      path: RouterPaths.change_operator,
      builder: (BuildContext context, GoRouterState state) =>
          const ChangeOperatorScreen(),
    ),
    //File
    GoRoute(
      path: RouterPaths.home,
      builder: (BuildContext context, GoRouterState state) =>
          const HomeScreen(),
    ),
    GoRoute(
      path: RouterPaths.file_upload,
      builder: (BuildContext context, GoRouterState state) =>
          const FileUploadScreen(),
    ),
    GoRoute(
      path: RouterPaths.files,
      builder: (BuildContext context, GoRouterState state) =>
          const ReadFilesScreen(),
    ),
  ],
);
