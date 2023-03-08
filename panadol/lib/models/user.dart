class MyUser {
  final String profileImagePath;
  final String firstName;
  final String lastName;
  final String learningGoal;
  final String job;
  final String userId;
  MyUser({
    required this.profileImagePath,
    required this.firstName,
    required this.lastName,
    required this.learningGoal,
    required this.job,
    required this.userId,
  });

  Map<String, Object?> toFirestoreObj() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'profileImage': profileImagePath,
      'job': job,
      'learningGoal': learningGoal,
    };
  }

  factory MyUser.fromFirebase(Map<String, dynamic>? firebaseUser) {
    String firstName = firebaseUser!['firstName'];
    String lastName = firebaseUser['lastName'];
    String userId = firebaseUser['userId'];
    String learningGoal = firebaseUser['learningGoal'];
    String profileImagePath = firebaseUser['profileImage'];
    String job = firebaseUser['job'];

    return MyUser(
      firstName: firstName,
      lastName: lastName,
      userId: userId,
      learningGoal: learningGoal,
      job: job,
      profileImagePath: profileImagePath,
    );
  }
}
