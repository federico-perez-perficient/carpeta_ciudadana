import 'dart:convert';

import 'package:carpeta_ciudadana/features/operator/domain/entities/gov_operator.dart';

class GovOperatorModel extends GovOperator {
  const GovOperatorModel({
    required String name,
    required int operatorId,
    required String operatorUrl,
  }) : super(
          name: name,
          operatorId: operatorId,
          operatorUrl: operatorUrl,
        );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'operatorId': operatorId,
      'operatorUrl': operatorUrl,
    };
  }

  String toJson() => jsonEncode(toMap());
}
