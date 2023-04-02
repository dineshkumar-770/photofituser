// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_details_cubit.dart';

abstract class UserDetailsState {}

class PinCodeAddressStateInitial extends UserDetailsState {}

class PinCodeAddressStateLoading extends UserDetailsState {}

class PinCodeAddressStateSuccess extends UserDetailsState {
  final List<PinCodeAddress> pinCodeAddress;
  PinCodeAddressStateSuccess({
    required this.pinCodeAddress,
  });
}

class PinCodeAddressStateError extends UserDetailsState {
  final String errorMessage;
  PinCodeAddressStateError({
    required this.errorMessage,
  });
}
