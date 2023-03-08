// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:panadol/models/user.dart';

class UserDataApi {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //!now when we add the user data we will add the name and
  //!the phone number of the email which he signed in with
  Future<String> addUserDate({
    required MyUser user,
  }) async {
    try {
      await firestore.collection('users').doc(user.userId).set(
            user.toFirestoreObj(),
          );
      return 'done';
    } on FirebaseException catch (e) {
      return e.code;
    }
  }

  Future<Map<bool, dynamic>> getUserData({required String id}) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDocumentSnapshot =
          await firestore.collection("users").doc(id).get();
      Map<String, dynamic>? userData = userDocumentSnapshot.data();
      return {true: MyUser.fromFirebase(userData)};
    } on FirebaseException catch (e) {
      return {false: e.code};
    } catch (e) {
      return {false: e.toString()};
    }
  }

  Future<String> isUserExists({required String id}) async {
    try {
      List<MyUser> myUsers = [];
      String isExist = 'not exist';
      QuerySnapshot<Map<String, dynamic>> userDocumentSnapshot =
          await firestore.collection("users").get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> users =
          userDocumentSnapshot.docs;

      users.forEach((user) {
        myUsers.add(MyUser.fromFirebase(user.data()));
      });
      myUsers.forEach((user) {
        if (user.userId == id) {
          isExist = 'done';
        }
      });
      return isExist;
    } on FirebaseException catch (e) {
      return e.code;
    }
  }
}
