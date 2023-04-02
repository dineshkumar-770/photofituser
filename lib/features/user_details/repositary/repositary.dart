import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:photo_fit_user/features/user_details/model/pin_code_address.dart';

class ApiRepositary {
  Future<List<PinCodeAddress>> getAddressFromPinCode(String pinCode) async {
    String endpoints = 'https://api.postalpincode.in/pincode/$pinCode';
    Uri url = Uri.parse(endpoints);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      // final List<PinCodeAddress> postOffices = [];
      // if (parsed[0]['PostOffice'] != null) {
      //   for (var postOfficeJson in parsed[0]['PostOffice']) {
      //     postOffices.add(PinCodeAddress.fromJson(postOfficeJson));
      //   }
      // log(postOffices.toString());
      List<PinCodeAddress> data = pinCodeAddressFromJson(response.body);
      return data;
    } else {
      throw 'error';
    }
  }
}
