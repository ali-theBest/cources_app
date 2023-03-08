import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());
}
