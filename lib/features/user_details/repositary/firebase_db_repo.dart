import 'package:firebase_auth/firebase_auth.dart';
import 'package:photo_fit_user/features/user_details/model/delevary_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseRepositary {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future saveUserDetails({
    required String name,
    required String addressOne,
    required String addressTwo,
    required String mobile,
    required String pincode,
    required String region,
    required String city,
    required String state,

  }) async {
    final userData = UserDeliveryDetails(
        name: name,
        addressOne: addressOne,
        addressTwo: addressTwo,
        mobile: mobile,
        pincode: pincode,
        region: region,
        city: city,
        state: state);

    final docRef = firestore
        .collection('users')
        .withConverter(
            fromFirestore: UserDeliveryDetails.fromFirestore,
            toFirestore: (UserDeliveryDetails value, options) =>
                userData.toFirestore())
        .doc(FirebaseAuth.instance.currentUser?.uid);
    await docRef.set(userData);
  }
}
