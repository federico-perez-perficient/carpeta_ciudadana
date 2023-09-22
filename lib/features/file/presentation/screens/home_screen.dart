import 'package:carpeta_ciudadana/core/constants/router_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Carpeta ciudadana'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ],
        ),
        body: SafeArea(
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
                      onPressed: () {},
                      child: Text('Ver documentos'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
