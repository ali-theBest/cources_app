// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:panadol/models/constants/enums.dart';
import 'package:panadol/models/firebase/apis/learning_material_api.dart';
import 'package:panadol/models/learning_material.dart';

part 'learning_material_event.dart';
part 'learning_material_state.dart';

class LearningMaterialBloc
    extends Bloc<LearningMaterialEvent, LearningMaterialState> {
  final LearningMaterialApi learningMaterialApi = LearningMaterialApi();
  LearningMaterialBloc() : super(LearningMaterialInitial()) {
    on<GetMaterialsEvent>((event, emit) async {
      // TODO: implement event handler
      emit(const GetMaterialsLoadingState(loading: true));
      Map<bool, dynamic> materials =
          await learningMaterialApi.getCategoryLearningMaterialData(
        category: event.category,
      );
      if (materials.keys.first) {
        emit(GotMaterialsState(learningMaterial: materials.values.first));
        emit(const GetMaterialsLoadingState(loading: false));
      } else {
        emit(GetMaterialsErrorState(error: materials.values.first));
        emit(const GetMaterialsLoadingState(loading: false));
      }
    });
    on<SearchForMaterialEvent>((event, emit) async {
      // TODO: implement event handler
      emit(const GetMaterialsLoadingState(loading: true));
      Map<bool, dynamic> materials =
          await learningMaterialApi.searchLearningMaterialData(
        searchKey: event.searchKey,
      );
      if (materials.keys.first) {
        emit(GotSearchedMaterialsState(
            learningMaterial: materials.values.first));
        emit(const GetMaterialsLoadingState(loading: false));
      } else {
        emit(GetMaterialsErrorState(error: materials.values.first));
        emit(const GetMaterialsLoadingState(loading: false));
      }
    });
  }
}
