part of 'gallery_bloc.dart';


abstract class GalleryState {}

class GalleryInitial extends GalleryState {}

class GalleryLoading extends GalleryState {}

class GallerySuccess extends GalleryState {
  final List<GalleryModel> galleryList;

  GallerySuccess(this.galleryList);
}

class GalleryFailure extends GalleryState {
  final String errorMessage;

  GalleryFailure(this.errorMessage);
}
