import 'package:dio/dio.dart';
import 'package:innlabtest/logic/gallery/datasources/gallery_datasource.dart';
import 'package:innlabtest/logic/gallery/models/gallery_model.dart';

abstract class GalleryRemoteRepository {
  Future<List<GalleryModel>> getGalleryList();
  Future<GalleryModel> getGalleryOnly(String id);
}

class GalleryRemoteRepositoryImpl implements GalleryRemoteRepository {
  final GalleryRemoteDataSource galleryRemoteDataSource;

  GalleryRemoteRepositoryImpl(this.galleryRemoteDataSource);

  @override
  Future<List<GalleryModel>> getGalleryList() async {
    print("I am calling datasource function to get user list");
    Response response = await galleryRemoteDataSource.getGalleryList();
    print("I am converting data to user model");
    return (response.data as List).map((i) => GalleryModel.fromJson(i)).toList();
  }

  @override
  Future<GalleryModel> getGalleryOnly(String id) async {
    Response response = await galleryRemoteDataSource.getGalleryOnly(id);
    return GalleryModel.fromJson(response.data);
  }
}