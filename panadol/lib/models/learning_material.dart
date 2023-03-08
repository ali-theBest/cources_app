import 'package:panadol/models/constants/enums.dart';

class LearningMaterial {
  const LearningMaterial({
    required this.name,
    required this.materialType,
    required this.category,
    required this.instructorName,
    required this.numberOfRating,
    required this.courseImagePath,
    required this.duration,
    required this.rating,
  });
  final String name;
  final LearningMaterialType materialType;
  final String category;
  final String instructorName;
  final int numberOfRating;
  final double rating;
  final double duration;
  final String courseImagePath;

  Map<String, Object?> toFirestoreObj() {
    return {
      'name': name,
      'materialType': materialTypes[materialType],
      'category': category,
      'instructorName': instructorName,
      'numberOfRating': numberOfRating,
      'courseImagePath': courseImagePath,
      'duration': duration,
      'rate': rating,
    };
  }

  factory LearningMaterial.fromFirebase(
    Map<String, dynamic>? firebaseLearningMaterial,
  ) {
    String name = firebaseLearningMaterial!['name'];
    String type = firebaseLearningMaterial['materialType'];
    LearningMaterialType learningMaterialType = materialTypes.keys.firstWhere(
      (key) => materialTypes[key] == type,
    );
    String instructorName = firebaseLearningMaterial['instructorName'];
    String category = firebaseLearningMaterial['category'];
    int numberOfRating = firebaseLearningMaterial['numberOfRating'];
    String courseImagePath = firebaseLearningMaterial['courseImagePath'];
    double rating = firebaseLearningMaterial['rate'];
    double duration = firebaseLearningMaterial['duration'];

    return LearningMaterial(
      name: name,
      materialType: learningMaterialType,
      category: category,
      instructorName: instructorName,
      numberOfRating: numberOfRating,
      courseImagePath: courseImagePath,
      rating: rating,
      duration: duration,
    );
  }
}
