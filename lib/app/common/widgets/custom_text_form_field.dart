// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gasto_certo/app/common/constants/app_text_styles.dart';

import '../constants/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsets? padding;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextInputAction? inputAction;
  final Widget? sufixIcon;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFormField({
    Key? key,
    this.padding,
    this.hintText,
    this.labelText,
    this.helperText,
    this.textCapitalization,
    this.controller,
    this.keyboardType,
    this.maxLength,
    this.inputAction,
    this.sufixIcon,
    this.obscureText,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder =
      const OutlineInputBorder(borderSide: BorderSide(color: AppColors.grey));

  String? _helperText;

  @override
  void initState() {
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            setState(() {
              _helperText = null;
            });
          } else if (value.isEmpty) {
            setState(() {
              _helperText = widget.helperText;
            });
          }
        },
        validator: widget.validator,
        obscureText: widget.obscureText ?? false,
        maxLength: widget.maxLength,
        controller: widget.controller,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        textInputAction: widget.inputAction,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.words,
        decoration: InputDecoration(
          helperMaxLines: 3,
          helperText: _helperText,
          suffixIcon: widget.sufixIcon,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.hintText,
          labelText: widget.labelText?.toUpperCase(),
          labelStyle: AppTextStyle.inputText.copyWith(color: AppColors.grey),
          focusedBorder: defaultBorder.copyWith(
              borderSide: const BorderSide(color: AppColors.darkBlue)),
          errorBorder: defaultBorder,
          focusedErrorBorder: defaultBorder,
          enabledBorder: defaultBorder.copyWith(),
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
