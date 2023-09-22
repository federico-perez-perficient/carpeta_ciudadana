import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:carpeta_ciudadana/core/constants/router_paths.dart';
import 'package:carpeta_ciudadana/features/file/presentation/bloc/file_bloc.dart';

class FileUploadScreen extends StatefulWidget {
  const FileUploadScreen({Key? key}) : super(key: key);

  @override
  State<FileUploadScreen> createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final double boxWidth = min(width * 0.8, 500);
    return Scaffold(
      appBar: AppBar(
        title: Text('File upload'),
        leading: IconButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(RouterPaths.home);
            }
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: BlocConsumer<FileBloc, FileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Center(
            child: Container(
              width: boxWidth,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).secondaryHeaderColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.upload_file),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<FileBloc>().add(FilePickingEvent());
                    },
                    child: const Text('Select File'),
                  ),
                  const SizedBox(height: 10),
                  (state is FilePickedState)
                      ? const Text('File selected')
                      : const Text('No file selected'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: (state is FilePickedState)
                        ? () async {
                            // await uploadSelectedFile();
                          }
                        : null,
                    child: const Text('Upload File'),
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
