// ignore_for_file: depend_on_referenced_packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:panadol/models/constants/constant_lists.dart';
import 'package:panadol/models/constants/enums.dart';
import 'package:panadol/models/learning_material.dart';

class LearningMaterialApi {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //!now when we add the user data we will add the name and
  //!the phone number of the email which he signed in with
  Future<String> addLearningMaterial({
    required LearningMaterial learningMaterial,
  }) async {
    try {
      await firestore
          .collection(learningMaterial.category)
          .doc(learningMaterial.name)
          .set(
            learningMaterial.toFirestoreObj(),
          );
      return 'done';
    } on FirebaseException catch (e) {
      return e.code;
    }
  }

  Future<Map<bool, dynamic>> getCategoryLearningMaterialData({
    required String category,
  }) async {
    try {
      QuerySnapshot<Map<String, dynamic>> userDocumentSnapshot =
          await firestore.collection(category).get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> categoryCourses =
          userDocumentSnapshot.docs;
      List<LearningMaterial> courses = [];
      categoryCourses.forEach((course) {
        courses.add(LearningMaterial.fromFirebase(course.data()));
      });

      return {true: courses};
    } on FirebaseException catch (e) {
      return {false: e.code};
    } catch (e) {
      return {false: e.toString()};
    }
  }

  Future<Map<bool, dynamic>> searchLearningMaterialData({
    required String searchKey,
  }) async {
    try {
      List<LearningMaterial> courses = [];
      // ignore: avoid_function_literals_in_foreach_calls
      mostFamousJobs.forEach((category) async {
        QuerySnapshot<Map<String, dynamic>> userDocumentSnapshot =
            await firestore.collection(category).get();
        List<QueryDocumentSnapshot<Map<String, dynamic>>> categoryCourses =
            userDocumentSnapshot.docs;

        categoryCourses.forEach((course) {
          courses.add(LearningMaterial.fromFirebase(course.data()));
        });
      });
      List<LearningMaterial> searchedMaterialList = courses.where((course) {
        return course.name.contains(searchKey);
      }).toList();
      return {true: searchedMaterialList};
    } on FirebaseException catch (e) {
      return {false: e.code};
    } catch (e) {
      return {false: e.toString()};
    }
  }
}
