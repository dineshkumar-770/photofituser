import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:photo_fit_user/features/user_details/model/pin_code_address.dart';
import 'package:photo_fit_user/features/user_details/repositary/repositary.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(PinCodeAddressStateInitial());

  ApiRepositary apiRepositary = ApiRepositary();

  void fetchPinAddress(String pinCode) async {
    emit(PinCodeAddressStateLoading());
    try {
      List<PinCodeAddress> finalData =
          await apiRepositary.getAddressFromPinCode(pinCode);
      if (finalData[0].postOffice != null) {
        log(finalData.toString(), name: 'Cubit data:');
        emit(PinCodeAddressStateSuccess(pinCodeAddress: finalData));
      } else {
        emit(PinCodeAddressStateError(
            errorMessage:
                'PIN you entered is invalid or does not exist hence ${finalData[0].message}'));
      }
    } on SocketException catch (e) {
      emit(PinCodeAddressStateError(errorMessage: e.message));
    }
  }

  void selectCity(String value) {}
}
