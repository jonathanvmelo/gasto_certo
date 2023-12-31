// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:gasto_certo/app/common/constants/app_colors.dart';

import 'package:gasto_certo/app/common/widgets/custom_text_form_field.dart';

class PasswordTextForm extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsets? padding;
  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final Widget? sufixIcon;
  final String? helperText;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onEditingComplete;
  const PasswordTextForm({
    Key? key,
    this.controller,
    this.padding,
    this.hintText,
    this.labelText,
    this.maxLength,
    this.sufixIcon,
    this.helperText,
    this.validator,
    this.onEditingComplete,
  }) : super(key: key);

  @override
  State<PasswordTextForm> createState() => _PasswordTextFormState();
}

class _PasswordTextFormState extends State<PasswordTextForm> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      helperText: widget.helperText,
      validator: widget.validator,
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      maxLength: widget.maxLength,
      obscureText: isHidden,
      sufixIconColor: isHidden ? AppColors.greyDark : AppColors.orange,
      textCapitalization: TextCapitalization.none,
      onEditingComplete: widget.onEditingComplete ??
          () {
            FocusScope.of(context).nextFocus();
          },
      sufixIcon: InkWell(
        borderRadius: BorderRadius.circular(23),
        child: Icon(isHidden ? Icons.visibility : Icons.visibility_off),
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },
      ),
    );
  }
}
