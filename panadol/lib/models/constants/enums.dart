enum FieldsType {
  phoneNumber,
  name,
  password,
}

enum LearningMaterialType {
  course,
  article,
  book,
}

const Map<LearningMaterialType, String> materialTypes = {
  LearningMaterialType.course: "Courses",
  LearningMaterialType.article: "Article",
  LearningMaterialType.book: "Books"
};
