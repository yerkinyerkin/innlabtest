import 'package:dio/dio.dart';

abstract class GalleryRemoteDataSource {
  Future<Response> getGalleryList();
  Future<Response> getGalleryOnly(String id);

}

class GalleryRemoteDataSourceImpl implements GalleryRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<Response> getGalleryList() async {
    print("I am making API call to backend");
    Response response = await dio.get('https://jsonplaceholder.typicode.com/albums');
    print("I got data from backend");
    return response;
  }

  @override
  Future<Response> getGalleryOnly(String id) async {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/albums/$id');
    return response;
  }
}