import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_fit_user/common_widgets/custom_button.dart';
import 'package:photo_fit_user/common_widgets/custom_dropdown.dart';
import 'package:photo_fit_user/common_widgets/flutter_toast.dart';
import 'package:photo_fit_user/common_widgets/gap.dart';
import 'package:photo_fit_user/common_widgets/loading_animation.dart';
import 'package:photo_fit_user/constants/app_color.dart';
import 'package:photo_fit_user/features/user_details/cubit/user_details_cubit.dart';
import 'package:photo_fit_user/features/user_details/repositary/firebase_db_repo.dart';
import 'package:photo_fit_user/features/user_details/widgets/form_textfield.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key});

  @override
  State<UserDetailsScreen> createState() => _DemoPinScreenState();
}

class _DemoPinScreenState extends State<UserDetailsScreen> {
  late UserDetailsCubit userDetailsCubit;
  String? city;
  String? region;
  String? stateRegion;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    userDetailsCubit = BlocProvider.of(context);
  }

  TextEditingController pinController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController additionalInfoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UserDetailsFormField(
                    onChanged: (value) {},
                    textEditingController: nameController,
                    textInputType: TextInputType.name,
                    formatters: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    hint: 'Enter your name',
                    label: 'Full name',
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Name cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const Gap(height: 15),
                  UserDetailsFormField(
                    onChanged: (value) {},
                    textEditingController: addressController,
                    textInputType: TextInputType.streetAddress,
                    hint: 'Enter your address line 1',
                    label: 'Address Line 1',
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Address line 1 cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const Gap(height: 15),
                  UserDetailsFormField(
                    onChanged: (value) {},
                    textEditingController: additionalInfoController,
                    textInputType: TextInputType.streetAddress,
                    hint: 'Enter your address line 2',
                    label: 'Address Line 2',
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Address line 2 cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const Gap(height: 15),
                  UserDetailsFormField(
                    onChanged: (value) {},
                    textEditingController: mobileController,
                    textInputType: TextInputType.number,
                    formatters: [FilteringTextInputFormatter.digitsOnly],
                    hint: 'Enter mobile number',
                    maxLength: 10,
                    label: 'Mobile number',
                    validation: (String? value) {
                      if (value!.isEmpty) {
                        return 'Mobile number cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const Gap(height: 15),
                  UserDetailsFormField(
                    onChanged: (value) {
                      if (value.length >= 6) {
                        userDetailsCubit.fetchPinAddress(pinController.text);
                      }
                    },
                    textEditingController: pinController,
                    textInputType: TextInputType.number,
                    formatters: [FilteringTextInputFormatter.digitsOnly],
                    hint: 'Enter PIN number',
                    maxLength: 6,
                    label: 'Pin Code',
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'Pincode cannot be empty';
                      }
                      return null;
                    },
                  ),
                  const Gap(height: 15),
                  BlocConsumer<UserDetailsCubit, UserDetailsState>(
                    listener: (context, state) {
                      if (state is PinCodeAddressStateError) {
                        log('Error');
                        Toast.showToast(state.errorMessage);
                      }
                    },
                    builder: (context, state) {
                      if (state is PinCodeAddressStateLoading) {
                        return const Center(
                          child: CustomLoader(),
                        );
                      } else if (state is PinCodeAddressStateSuccess) {
                        return Column(
                          children: [
                            CustomDropDown(
                                labelTitle: 'Region/Area',
                                hintText: 'Select area/region',
                                onChanged: (value) {
                                  log(value.toString(), name: 'area');
                                  region = value;
                                },
                                selectedValue: null,
                                context: context,
                                listofitems: List.generate(
                                    state.pinCodeAddress[0].postOffice
                                            ?.length ??
                                        0,
                                    (index) =>
                                        state.pinCodeAddress[0]
                                            .postOffice?[index].name ??
                                        ''),
                                labelGap: 7,
                                height: 80,
                                width: double.infinity),
                            CustomDropDown(
                                labelTitle: 'City',
                                hintText: 'Select city',
                                onChanged: (value) {
                                  log(value.toString(), name: 'city');
                                  city = value;
                                },
                                selectedValue: null,
                                context: context,
                                listofitems: [
                                  state.pinCodeAddress[0].postOffice?[0]
                                          .district ??
                                      ''
                                ],
                                labelGap: 7,
                                height: 80,
                                width: double.infinity),
                            CustomDropDown(
                                labelTitle: 'State',
                                hintText: 'Select state',
                                onChanged: (value) {
                                  log(value.toString(), name: 'state');
                                  stateRegion = value;
                                },
                                selectedValue: null,
                                context: context,
                                listofitems: [
                                  state.pinCodeAddress[0].postOffice?[0]
                                          .state ??
                                      ''
                                ],
                                labelGap: 7,
                                height: 80,
                                width: double.infinity),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Toast.showToast(
                                    'Please fill PIN code, Region/Area will be fetched automatically');
                              },
                              child: CustomDropDown(
                                  labelTitle: 'Region/Area',
                                  hintText: 'Select area/region',
                                  onChanged: (value) {},
                                  disableButton: false,
                                  selectedValue: null,
                                  context: context,
                                  listofitems: const [],
                                  labelGap: 7,
                                  height: 80,
                                  width: double.infinity),
                            ),
                            GestureDetector(
                              onTap: () {
                                Toast.showToast(
                                    'Please fill PIN code, City will be fetched automatically');
                              },
                              child: CustomDropDown(
                                  labelTitle: 'City',
                                  hintText: 'Select city',
                                  onChanged: (value) {},
                                  selectedValue: null,
                                  context: context,
                                  listofitems: const [],
                                  disableButton: false,
                                  labelGap: 7,
                                  height: 80,
                                  width: double.infinity),
                            ),
                            GestureDetector(
                              onTap: () {
                                Toast.showToast(
                                    'Please fill PIN code, State will be fetched automatically');
                              },
                              child: CustomDropDown(
                                  labelTitle: 'State',
                                  hintText: 'Select state',
                                  disableButton: false,
                                  onChanged: (value) {},
                                  selectedValue: null,
                                  context: context,
                                  listofitems: const [],
                                  labelGap: 7,
                                  height: 80,
                                  width: double.infinity),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                  CustomAppButton(
                    onTap: () async {
                      if (_formKey.currentState?.validate() == true) {
                      await FirebaseRepositary()
                          .saveUserDetails(
                            name: nameController.text,
                            addressOne: addressController.text,
                            addressTwo: additionalInfoController.text,
                            mobile: mobileController.text,
                            pincode: pinController.text,
                            city: city.toString(),
                            region: region.toString(),
                            state: stateRegion.toString()
                          )
                          .then((value) {
                        log('Data saved to firebase');
                      });
                      }
                    },
                    label: 'Next',
                    backgroungColor: AppColors.kPrimaryOrange,
                    borderRadius: 12,
                    height: 45,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
