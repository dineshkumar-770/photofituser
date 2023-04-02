// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
class UserDeliveryDetails {
  String name;
    String addressOne;
    String addressTwo;
    String mobile;
    String pincode;
    String region;
    String city;
    String state;

  UserDeliveryDetails({
    required this.name,
    required this.addressOne,
    required this.addressTwo,
    required this.mobile,
    required this.pincode,
    required this.region,
    required this.city,
    required this.state,
  });

  factory UserDeliveryDetails.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserDeliveryDetails(
      name: data?["name"],
      addressOne: data?["addressOne"],
      addressTwo: data?["addressTwo"],
      mobile: data?["mobile"],
      pincode: data?["pincode"],
      city: data?["city"],
      region: data?["region"],
      state: data?["state"]
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "addressOne": addressOne,
      "addressTwo":addressTwo,
      "mobile":mobile,
      "pincode":pincode,
      "city":city,
      "region":region,
      "state":state
    };
  }
}
