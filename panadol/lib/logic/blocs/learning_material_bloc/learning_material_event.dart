part of 'learning_material_bloc.dart';

@immutable
abstract class LearningMaterialEvent extends Equatable {
  const LearningMaterialEvent();
  @override
  List<Object?> get props => [];
}

class GetMaterialsEvent extends LearningMaterialEvent {
  const GetMaterialsEvent({
    required this.learningMaterialType,
    required this.category,
  });
  final LearningMaterialType learningMaterialType;
  final String category;
  @override
  List<Object?> get props => [
        learningMaterialType,
        category,
      ];
}

class SearchForMaterialEvent extends LearningMaterialEvent {
  const SearchForMaterialEvent({
    required this.learningMaterialType,
    required this.searchKey,
  });
  final LearningMaterialType learningMaterialType;
  final String searchKey;
  @override
  List<Object?> get props => [
        learningMaterialType,
        searchKey,
      ];
}
