import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String? errorText;
  final IconData? prefixIconData;
  final IconData? suffixIconData;
  final void Function()? suffixOnPressed;
  final String? hintText;
  final String? helperText;
  final TextInputType? textInputType;
  final TextEditingController textController;
  final bool obscureText;
  final int? maxLines;
  final bool readOnly;
  final String? Function(String?)? validator;
  final EdgeInsetsGeometry padding;

  const CustomTextFormField({
    super.key,
    this.prefixIconData,
    this.errorText,
    this.suffixIconData,
    this.suffixOnPressed,
    this.hintText,
    this.helperText,
    this.textInputType,
    required this.textController,
    this.obscureText = false,
    this.maxLines = 1,
    this.readOnly = false,
    this.validator,
    this.padding = const EdgeInsets.symmetric(vertical: 15),
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showHelperText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
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
            hintText: widget.hintText,
            helperText: showHelperText ? widget.helperText : null,
            helperStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: const Color(0xFF717171)),
            errorStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).primaryColor),
            prefixIcon: (widget.prefixIconData != null)
                ? Icon(widget.prefixIconData)
                : null,
            suffixIcon: (widget.suffixOnPressed != null)
                ? GestureDetector(
                    onTap: widget.suffixOnPressed,
                    child: Icon(widget.suffixIconData),
                  )
                : Icon(widget.suffixIconData),
          ),
          keyboardType: widget.textInputType,
          maxLines: widget.obscureText ? 1 : widget.maxLines,
          obscureText: widget.obscureText,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
              ),
          readOnly: widget.readOnly,
          validator: widget.validator,
        ),
      ),
    );
  }
}
