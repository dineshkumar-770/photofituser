import 'dart:core';
import 'package:flutter/material.dart';
import 'package:photo_fit_user/config/responsive/size_config.dart';
import 'package:photo_fit_user/constants/app_color.dart';
import 'package:photo_fit_user/constants/app_text_style.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    required this.labelTitle,
    required this.hintText,
    required this.onChanged,
    required this.selectedValue,
    required this.context,
    required this.listofitems,
    required this.labelGap,
    required this.height,
    required this.width,
    this.validation,
    this.iconsize,
    this.formKey,
    super.key,
    this.disableButton,
  });

  final String? labelTitle;
  final String? hintText;
  final void Function(String?)? onChanged;
  final String? selectedValue;
  final double? iconsize;
  final Key? formKey;
  final String? Function(String?)? validation;
  final List<dynamic>? listofitems;
  final BuildContext context;
  final double labelGap;
  final double height;
  final double width;
  final bool? disableButton;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disableButton ?? false,
      child: Theme(
        data: ThemeData(
            splashColor: AppColors.kTransparent,
            highlightColor: AppColors.kTransparent,
            hoverColor: AppColors.kTransparent),
        child: SizedBox(
          height: (height) * SizeConfig.heightMultiplier!,
          width: (width) * SizeConfig.widthMultiplier!,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(labelTitle!, style: AppTextStyle.regularGrey14w400),
              SizedBox(
                height: (labelGap) * SizeConfig.heightMultiplier!,
              ),
              // drop down
              DropdownButtonHideUnderline(
                child: Expanded(
                  child: DropdownButtonFormField(
                    focusColor: AppColors.kTransparent,
                    isExpanded: true,
                    validator: validation,
                    isDense: true,
                    style: AppTextStyle.regularBlack16w400,
                    decoration: InputDecoration(
                      focusColor: AppColors.red240,
                      hoverColor: AppColors.kPrimaryOrange,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16 * SizeConfig.widthMultiplier!,
                          vertical: 2 * SizeConfig.heightMultiplier!),
                      errorBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1.0, color: AppColors.red240),
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.0 * SizeConfig.widthMultiplier!,
                              color: Colors.white),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.0 * SizeConfig.widthMultiplier!,
                              color: AppColors.kPrimaryOrange),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          )),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.0 * SizeConfig.widthMultiplier!,
                              color: AppColors.grey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1.0 * SizeConfig.widthMultiplier!,
                              color: AppColors.grey),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          )),
                    ),
                    hint:
                        Text(hintText!, style: AppTextStyle.regularGrey14w400),

                    iconSize: iconsize ?? 0,
                    iconEnabledColor: AppColors.grey,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: listofitems!
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: SizedBox(
                                width: 225 * SizeConfig.widthMultiplier!,
                                child: Text(item,
                                    style: AppTextStyle.regularGrey14w400),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    // selectedItemBuilder: (BuildContext context) {
                    // return listofitems!.map((String value) {
                    // return Align(
                    // alignment: Alignment.centerLeft,
                    // child: Text(selectedValue ?? "",
                    //           style: AppTextStyle.regularBlack16w400),
                    //     );
                    //   }).toList();
                    // },
                    onChanged: onChanged,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
