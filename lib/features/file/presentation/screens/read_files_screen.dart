import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:carpeta_ciudadana/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:carpeta_ciudadana/shared/custom_spinning_progress_circular_indicator.dart';
import 'package:carpeta_ciudadana/features/file/presentation/bloc/file_bloc.dart';

class ReadFilesScreen extends StatefulWidget {
  const ReadFilesScreen({Key? key}) : super(key: key);

  @override
  State<ReadFilesScreen> createState() => _ReadFilesScreenState();
}

class _ReadFilesScreenState extends State<ReadFilesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, signInState) {
        return Scaffold(
          appBar: AppBar(title: Text('Tus Documentos'), actions: [
            IconButton(
                onPressed: () {
                  if (signInState is SignedInUserState) {
                    context
                        .read<FileBloc>()
                        .add(FileReadEvent(userId: signInState.userId));
                  }
                },
                icon: Icon(
                  Icons.replay_outlined,
                )),
          ]),
          body: BlocBuilder<SignInBloc, SignInState>(
            builder: (context, signInState) {
              if (signInState is SignedInUserState) {
                return BlocConsumer<FileBloc, FileState>(
                    listener: (context, state) {
                  if (state is FileErrorState) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              'Hubo un problema, intenta nuevamente mas tarde',
                            ),
                            actions: [
                              FilledButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: Text('Close'),
                              )
                            ],
                          );
                        });
                  } else if (state is FileCerificatedState) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(state.response),
                            actions: [
                              FilledButton(
                                onPressed: () {
                                  context.pop();
                                },
                                child: Text('Close'),
                              )
                            ],
                          );
                        });
                  }
                }, builder: (context, state) {
                  if (state is FileLoadingState) {
                    return Center(
                      child: CustomSpinningCircularProgressIndicator(),
                    );
                  } else if (state.files == null || state.files!.isEmpty) {
                    return Center(
                      child: FilledButton(
                        onPressed: () {
                          context
                              .read<FileBloc>()
                              .add(FileReadEvent(userId: signInState.userId));
                        },
                        child: Text('Obtener mis archivos'),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: state.files!.length,
                      itemBuilder: (context, index) {
                        final docFile = state.files![index];
                        final filename = docFile.key
                            .replaceFirst('${signInState.userId}/', '');
                        return ListTile(
                          title: Text(filename),
                          subtitle: Row(
                            children: [
                              TextButton(
                                child: Text('Certificar documento ✔'),
                                onPressed: () {
                                  context
                                      .read<FileBloc>()
                                      .add(FileAuthenticateEvent(
                                        userId: signInState.userId.toString(),
                                        docKey: docFile.key,
                                        docTitle: filename,
                                      ));
                                },
                              ),
                              TextButton(
                                child: Text('Eliminar documento ✘'),
                                onPressed: () {
                                  print('EL KEY QUE LE ESTOY PASANDO');
                                  print(docFile.key);
                                  context.read<FileBloc>().add(FileDeleteEvent(
                                        docKey: docFile.key,
                                      ));
                                },
                              ),
                            ],
                          ),
                          onTap: () {},
                        );
                      },
                    );
                  }
                });
              } else {
                return Container(
                  child: Text('Que pasa?'),
                );
              }
            },
          ),
        );
      },
    );
  }
}
