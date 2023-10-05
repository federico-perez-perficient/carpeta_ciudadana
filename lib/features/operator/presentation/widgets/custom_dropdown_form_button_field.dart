import 'package:flutter/material.dart';

import 'package:carpeta_ciudadana/features/operator/domain/entities/gov_operator.dart';

class CustomDropdownFormButtonField extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final List<GovOperator> dropdownValues;
  final ValueChanged<GovOperator?> onChanged;
  final String? Function(GovOperator?)? validator;

  const CustomDropdownFormButtonField({
    super.key,
    required this.dropdownValues,
    this.padding = const EdgeInsets.symmetric(vertical: 15),
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: DropdownButtonFormField(
          borderRadius: BorderRadius.circular(10),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.only(top: 15, bottom: 15, left: 25, right: 12),
            filled: true,
            fillColor: const Color(0x18B7BBC0),
            floatingLabelAlignment: FloatingLabelAlignment.start,
            hintText: 'Selecciona un operador',
            hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: const Color(0xFF636264),
                  fontWeight: FontWeight.w600,
                ),
            errorStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          items: dropdownValues.map((operator) {
            return DropdownMenuItem(
              value: operator,
              child: Text(operator.name),
            );
          }).toList(),
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
          onChanged: onChanged,
          validator: validator,
        ),
      ),
    );
  }
}
