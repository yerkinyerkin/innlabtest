part of 'gallery_into_bloc.dart';


abstract class GalleryIntoState {}

class GalleryIntoInitial extends GalleryIntoState {}

class GalleryIntoLoading extends GalleryIntoState {}

class GalleryIntoSuccess extends GalleryIntoState {
  final List<GalleryIntoModel> galleryIntoList;

  GalleryIntoSuccess(this.galleryIntoList);
}

class GalleryIntoFailure extends GalleryIntoState {
  final String errorMessage;

  GalleryIntoFailure(this.errorMessage);
}
