import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_fit_user/constants/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.validator,
      this.controller,
      this.labelText,
      this.onCompleted,
      this.onChange, this.inputFormatters, this.keyboardType, this.maxLength});
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? labelText;
  final void Function()? onCompleted;
  final void Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onEditingComplete: onCompleted,
      onChanged: onChange,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: AppColors.orange300,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: AppColors.orange300, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: AppColors.orange300,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: AppColors.orange300,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
