import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final String? errorText;
  final IconData? prefixIconData;
  final IconData? sufficIconData;
  final String? hintText;
  final String? helperText;
  final TextInputType? textInputType;
  final TextEditingController textController;
  final int? maxLines;
  final String? Function(String?)? validator;

  const CustomPasswordField({
    super.key,
    this.prefixIconData,
    this.errorText,
    this.sufficIconData,
    this.hintText,
    this.helperText,
    this.textInputType,
    required this.textController,
    this.maxLines = 1,
    this.validator,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool hidePassword = true;
  bool showHelperText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextFormField(
          autocorrect: false,
          controller: widget.textController,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: (widget.prefixIconData == null)
                ? const EdgeInsets.only(top: 15, bottom: 15, left: 20)
                : const EdgeInsets.symmetric(vertical: 15),
            filled: true,
            fillColor: const Color(0x18B7BBC0),
            errorStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).primaryColor),
            hintText: widget.hintText,
            helperText: showHelperText ? widget.helperText : null,
            helperStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: const Color(0xFF717171)),
            prefixIcon: (widget.prefixIconData != null)
                ? Icon(widget.prefixIconData)
                : null,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() => hidePassword = !hidePassword);
              },
              child: Icon(
                hidePassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          keyboardType: widget.textInputType,
          maxLines: 1,
          obscureText: hidePassword,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Manrope',
          ),
          validator: widget.validator,
        ),
      ),
    );
  }
}
