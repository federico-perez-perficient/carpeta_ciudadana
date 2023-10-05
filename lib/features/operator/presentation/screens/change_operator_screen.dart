import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:carpeta_ciudadana/features/signin/presentation/bloc/sign_in_bloc.dart';
import 'package:carpeta_ciudadana/features/operator/domain/entities/transfer_operator_params.dart';
import 'package:carpeta_ciudadana/shared/custom_spinning_progress_circular_indicator.dart';
import 'package:carpeta_ciudadana/features/operator/domain/entities/gov_operator.dart';
import 'package:carpeta_ciudadana/features/operator/presentation/bloc/operator_bloc.dart';
import 'package:carpeta_ciudadana/features/operator/presentation/widgets/custom_dropdown_form_button_field.dart';
import 'package:carpeta_ciudadana/core/constants/router_paths.dart';

class ChangeOperatorScreen extends StatelessWidget {
  const ChangeOperatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Operador'),
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
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: size.height * 0.015),
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: size.height * 0.8,
              width: size.height * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people_rounded),
                  SizedBox(height: 20),
                  _Form(),
                  SizedBox(height: 10),
                  OutlinedButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go(RouterPaths.home);
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<GovOperator> listGovOperators = [
      GovOperator(
        name: 'Operador 1',
        operatorId: 1,
        operatorUrl:
            'https://gatewaycifo.azurewebsites.net/api/transferCitizen ',
      ),
      GovOperator(
        name: 'Operador 2',
        operatorId: 2,
        operatorUrl:
            ' http://ac39d19f7b1e644d3b66902a683a57ab-328135341.us-west-2.elb.amazonaws.com/api/TransferCitizen',
      ),
      GovOperator(
        name: 'Operador 3',
        operatorId: 3,
        operatorUrl:
            'http://ab5edfc1527bc4c9b9b44c10e61fa007-1270366865.us-west-2.elb.amazonaws.com/api/transferCitizen',
      ),
      GovOperator(
        name: 'Operador 4',
        operatorId: 4,
        operatorUrl: 'https://valhasoftoperator.uk/receive-user',
      ),
    ];
    final bloc = context.read<OperatorBloc>();
    GovOperator? selectedGovOperator;
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, signInState) {
        return BlocConsumer<OperatorBloc, OperatorState>(
          listener: (context, state) {
            if (state is OperatorErrorState) {
              context.pop();
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text(
                          'El operador seleccionado no esta disponible en el momento, porfavor intenta de nuevo mas tarde'),
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
            } else if (state is OperatorLoadingState) {
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
            } else if (state is OperatorChangedState) {
              showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Ya te cambiaste'),
                      actions: [
                        FilledButton(
                          onPressed: () {
                            context.pop();
                            context.pop();
                            context.read<SignInBloc>().add(SignInitialEvent());
                            context.go(RouterPaths.login);
                          },
                          child: Text('Close'),
                        )
                      ],
                    );
                  });
            }
          },
          builder: (context, state) {
            return BlocBuilder<SignInBloc, SignInState>(
              builder: (context, signInState) {
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'A cual operador desea solicitar el cambio?',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      CustomDropdownFormButtonField(
                        dropdownValues: listGovOperators,
                        padding: const EdgeInsets.only(top: 2, bottom: 15),
                        onChanged: (selectedValue) {
                          selectedGovOperator = selectedValue;
                        },
                        validator: (govOperatorId) {
                          if (govOperatorId == null) {
                            return 'Selecciona un operador';
                          }
                          return null;
                        },
                      ),
                      FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (signInState is SignedInUserState) {
                              bloc.add(OperatorTransferEvent(
                                  transferOperatorParams:
                                      TransferOperatorParams(
                                userToken: signInState.token,
                                citizenName: signInState.userName,
                                citizenEmail: signInState.userEmail,
                                citizenId: signInState.userId,
                                operatorId: selectedGovOperator!.operatorId,
                                operatorUrl: selectedGovOperator!.operatorUrl,
                                operatorName: selectedGovOperator!.name,
                              )));
                            }
                          }
                        },
                        child: Text('Continue'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
