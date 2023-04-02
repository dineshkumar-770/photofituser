import 'package:flutter/material.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';
import 'package:photo_fit_user/constants/app_color.dart';
import 'package:photo_fit_user/constants/app_text_style.dart';

class NormalCustomTextField extends StatefulWidget {
  const NormalCustomTextField(
      {Key? key,
      String? label,
      String? hint,
      this.validator,
      this.isPasswordField,
      required this.controller})
      : label = label ?? 'Label',
        hint = hint ?? 'hint text',
        super(key: key);
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool? isPasswordField;

  @override
  // ignore: library_private_types_in_public_api
  _FFCustomTextFieldState createState() => _FFCustomTextFieldState();
}

class _FFCustomTextFieldState extends State<NormalCustomTextField> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return widget.isPasswordField ?? false
        ? Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.label,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.semiBoldBlack12w400),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0, 4 * SizeConfig.heightMultiplier!, 0, 0),
                child: TextFormField(
                  controller: widget.controller,
                  obscureText: showPassword,
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: AppTextStyle.regularBlack14w400,
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: Icon(
                        showPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: const Color(0xFF757575),
                        size: 22,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: AppColors.orange300,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: AppColors.kPrimaryOrange,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.red212,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.red212,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  style: AppTextStyle.regularBlack0514w400,
                  validator: widget.validator,
                ),
              ),
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.label,
                  textAlign: TextAlign.start,
                  style: AppTextStyle.semiBoldBlack12w400),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    0, 4 * SizeConfig.heightMultiplier!, 0, 0),
                child: TextFormField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: AppTextStyle.regularBlack14w400,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: AppColors.orange300,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: AppColors.kPrimaryOrange,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.red212,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.red212,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  style: AppTextStyle.regularBlack0514w400,
                  validator: widget.validator,
                ),
              ),
            ],
          );
  }
}
