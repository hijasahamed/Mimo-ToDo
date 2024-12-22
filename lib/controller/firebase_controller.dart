import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mimo_flutter_app/model/user_data_model.dart';

class FirebaseController extends GetxController {

  // Fun to Fetching user data from firebase collection
  Future<UserData?> checkIfUserAvailable(String email) async {
    final CollectionReference signupFirebaseObject =
        FirebaseFirestore.instance.collection('userData');

    try {
      QuerySnapshot querySnapshot =
          await signupFirebaseObject.where('email', isEqualTo: email).get();

      if (querySnapshot.docs.isNotEmpty) {
        QueryDocumentSnapshot doc = querySnapshot.docs.first;
        UserData userData = UserData(           
            email: doc['email'],
            name: doc['name'],
            uid: doc['uid']);
        return userData;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  
}
