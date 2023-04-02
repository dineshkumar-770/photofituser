// To parse this JSON data, do
//
//     final pinCodeAddress = pinCodeAddressFromJson(jsonString);

import 'dart:convert';

List<PinCodeAddress> pinCodeAddressFromJson(String str) =>
    List<PinCodeAddress>.from(
        json.decode(str).map((x) => PinCodeAddress.fromJson(x)));

String pinCodeAddressToJson(List<PinCodeAddress> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class PinCodeAddress {
  PinCodeAddress({
    required this.message,
    required this.status,
    this.postOffice,
  });

  String? message;
  String? status;
  List<PostOffice>? postOffice;

  factory PinCodeAddress.fromJson(Map<String, dynamic> json) => PinCodeAddress(
        message: json["Message"],
        status: json["Status"],
        postOffice: json["PostOffice"] != null
            ? List<PostOffice>.from(
                json["PostOffice"].map((x) => PostOffice.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "Message": message,
        "Status": status,
        "PostOffice": postOffice != null
            ? List<dynamic>.from(postOffice!.map((x) => x.toJson()))
            : null,
      };
}


class PostOffice {
  PostOffice({
    required this.name,
    required this.branchType,
    required this.deliveryStatus,
    required this.circle,
    required this.district,
    required this.division,
    required this.region,
    required this.block,
    required this.state,
    required this.country,
    required this.pincode,
  });

  String name;
  String branchType;
  String deliveryStatus;
  String circle;
  String district;
  String division;
  String region;
  String block;
  String state;
  String country;
  String pincode;

  factory PostOffice.fromJson(Map<String, dynamic> json) => PostOffice(
        name: json["Name"],
        branchType: json["BranchType"],
        deliveryStatus: json["DeliveryStatus"],
        circle: json["Circle"],
        district: json["District"],
        division: json["Division"],
        region: json["Region"],
        block: json["Block"],
        state: json["State"],
        country: json["Country"],
        pincode: json["Pincode"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "BranchType": branchType,
        "DeliveryStatus": deliveryStatus,
        "Circle": circle,
        "District": district,
        "Division": division,
        "Region": region,
        "Block": block,
        "State": state,
        "Country": country,
        "Pincode": pincode,
      };
}
