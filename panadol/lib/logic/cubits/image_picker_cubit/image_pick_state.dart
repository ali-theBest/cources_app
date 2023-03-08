part of 'image_pick_cubit.dart';

@immutable
abstract class ImagePickState extends Equatable {
  const ImagePickState();
}

class ImagePickInitial extends ImagePickState {
  const ImagePickInitial();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PickedImageState extends ImagePickState {
  final File file;
  const PickedImageState({required this.file});
  @override
  // TODO: implement props
  List<Object?> get props => [file];
}

class PickedImageErrorState extends ImagePickState {
  const PickedImageErrorState({required this.error,});
  final String error;
  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
