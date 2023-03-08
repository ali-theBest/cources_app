// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';
import 'package:equatable/equatable.dart';
import 'dart:io';

part 'image_pick_state.dart';

class ImagePickCubit extends Cubit<ImagePickState> {
  ImagePickCubit() : super(const ImagePickInitial());

  final _picker = ImagePicker();
  late File? _imagePicked;
  Future _pickImage() async {
    try {
      XFile? pickedImage = await _picker.pickImage(
        source: ImageSource.camera,
      );
      if (pickedImage != null) {
        _imagePicked = File(pickedImage.path);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void pickImageEvent() async {
    await _pickImage();
    if (_imagePicked != null) {
      emit(PickedImageState(file: _imagePicked!));
    } else {
      emit(const PickedImageErrorState(error: "No Image Selected"));
    }
  }
}
