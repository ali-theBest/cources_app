part of 'learning_material_bloc.dart';

@immutable
abstract class LearningMaterialState extends Equatable {
  const LearningMaterialState();
}

class LearningMaterialInitial extends LearningMaterialState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GotMaterialsState extends LearningMaterialState {
  final List<LearningMaterial> learningMaterial;
  const GotMaterialsState({
    required this.learningMaterial,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        learningMaterial,
      ];
}

class GetMaterialsErrorState extends LearningMaterialState {
  final String error;
  const GetMaterialsErrorState({
    required this.error,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        error,
      ];
}

class GetMaterialsLoadingState extends LearningMaterialState {
  final bool loading;
  const GetMaterialsLoadingState({
    required this.loading,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        loading,
      ];
}

class GotSearchedMaterialsState extends LearningMaterialState {
  final List<LearningMaterial> learningMaterial;
  const GotSearchedMaterialsState({
    required this.learningMaterial,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        learningMaterial,
      ];
}