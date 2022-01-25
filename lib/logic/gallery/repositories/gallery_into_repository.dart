import 'package:dio/dio.dart';
import 'package:innlabtest/logic/gallery/datasources/gallery_into_datasource.dart';
import 'package:innlabtest/logic/gallery/models/gallery_into_model.dart';

abstract class GalleryIntoRemoteRepository {
  Future<List<GalleryIntoModel>> getGalleryIntoList();
  Future<GalleryIntoModel> getGalleryIntoOnly(String id);
}

class GalleryIntoRemoteRepositoryImpl implements GalleryIntoRemoteRepository {
  final GalleryIntoRemoteDataSource galleryIntoRemoteDataSource;

  GalleryIntoRemoteRepositoryImpl(this.galleryIntoRemoteDataSource);

  @override
  Future<List<GalleryIntoModel>> getGalleryIntoList() async {
    print("I am calling datasource function to get user list");
    Response response = await galleryIntoRemoteDataSource.getGalleryIntoList();
    print("I am converting data to user model");
    return (response.data as List).map((i) => GalleryIntoModel.fromJson(i)).toList();
  }

  @override
  Future<GalleryIntoModel> getGalleryIntoOnly(String id) async {
    Response response = await galleryIntoRemoteDataSource.getGalleryIntoOnly(id);
    return GalleryIntoModel.fromJson(response.data);
  }
}