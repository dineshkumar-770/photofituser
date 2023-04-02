import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';
import 'package:photo_fit_user/constants/app_color.dart';
import 'package:photo_fit_user/constants/app_text_style.dart';

// ignore: must_be_immutable
class UserDetailsFormField extends StatelessWidget {
  UserDetailsFormField(
      {this.onSuffixTap,
      this.errorText,
      this.isrequired,
      this.hint,
      this.formatters,
      this.isObsecure = false,
      this.isDisabled = false,
      this.label,
      required this.onChanged,
      this.suffixWidget,
      this.prefixWidget,
      required this.textEditingController,
      required this.textInputType,
      this.validation,
      this.enabled = true,
      this.maxLength,
      Key? key})
      : super(key: key);
  TextEditingController textEditingController;
  ValueChanged<String> onChanged;
  String? Function(String?)? validation;
  TextInputType textInputType;
  String? label;
  bool isObsecure = false;
  bool? enabled;
  bool? isDisabled;
  bool? isrequired = false;
  GestureTapCallback? onSuffixTap;
  String? errorText;
  String? hint;
  Widget? suffixWidget;
  Widget? prefixWidget;
  Widget? preffix;
  List<TextInputFormatter>? formatters;
  int? maxLength;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.widthMultiplier! * 384,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label ?? '',
            style: AppTextStyle.regularGrey18w400.copyWith(
                fontSize: 14 * SizeConfig.textMultiplier!, height: 1.5),
          ),
          SizedBox(
            height: 8 * SizeConfig.heightMultiplier!,
          ),
          TextFieldContainer(
            isDisabled: isDisabled,
            enabled: enabled,
            formatters: formatters,
            validation: validation,
            textEditingController: textEditingController,
            onChanged: onChanged,
            textInputType: textInputType,
            hint: hint,
            onSuffixTap: onSuffixTap,
            errorText: errorText,
            isObsecure: isObsecure,
            suffixWidget: suffixWidget,
            prefixWidget: prefixWidget,
            maxLength: maxLength,
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFieldContainer extends StatelessWidget {
  TextFieldContainer(
      {this.validation,
      required this.textInputType,
      required this.textEditingController,
      this.suffixWidget,
      this.prefixWidget,
      this.formatters,
      required this.onChanged,
      this.isObsecure = false,
      this.isDisabled = false,
      this.hint,
      this.errorText,
      this.onSuffixTap,
      this.action = TextInputAction.done,
      this.maxLength,
      this.enabled = true,
      this.isDense = false,
      Key? key})
      : super(key: key);
  TextEditingController textEditingController;
  ValueChanged<String> onChanged;
  String? Function(String?)? validation;
  TextInputType textInputType;
  GestureTapCallback? onSuffixTap;
  bool isObsecure;
  bool? isDisabled;
  bool? enabled;
  String? hint;
  bool? isDense;
  String? errorText;
  Widget? suffixWidget;
  Widget? prefixWidget;
  int? maxLength;
  final TextInputAction action;
  List<TextInputFormatter>? formatters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: isDense == true?height:null,      width: Get.width,
      child: TextFormField(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        textCapitalization: TextCapitalization.words,
        inputFormatters: formatters,
        enabled: enabled,
        maxLength: maxLength,
        textInputAction: action,
        // cursorColor: grey80,
        controller: textEditingController,
        onChanged: (value) {
          onChanged(value);
        },
        onEditingComplete: () {},
        onFieldSubmitted: (va) {},
        keyboardType: textInputType,
        style: AppTextStyle.regularGrey14w400,
        textAlignVertical: TextAlignVertical.center,
        obscureText: isObsecure,
        validator: validation,
        decoration: InputDecoration(
            errorText: errorText,
            prefixIcon: prefixWidget,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            counterText: "",
            counterStyle: TextStyle(fontSize: 0 * SizeConfig.heightMultiplier!),
            contentPadding: EdgeInsets.symmetric(
                horizontal: 16 * SizeConfig.widthMultiplier!,
                vertical: 12 * SizeConfig.heightMultiplier!),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.0 * SizeConfig.widthMultiplier!,
                  color: AppColors.kPrimaryOrange,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.0 * SizeConfig.widthMultiplier!,
                  color: AppColors.grey,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            disabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.0 * SizeConfig.widthMultiplier!),
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            hintText: hint,
            errorStyle: AppTextStyle.regularBlack22w400.copyWith(
              fontSize: 12 * SizeConfig.textMultiplier!,
              color: AppColors.red240,
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.0,
                color: AppColors.red240,
              ),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(width: 1.0, color: AppColors.kPrimaryOrange),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            suffixIcon: suffixWidget != null
                ? GestureDetector(
                    onTap: onSuffixTap,
                    child: suffixWidget,
                  )
                : SizedBox(
                    height: 10 * SizeConfig.heightMultiplier!,
                    width: 10 * SizeConfig.widthMultiplier!,
                  ),
            hintStyle: AppTextStyle.regularGrey14w400),
      ),
    );
  }
}
