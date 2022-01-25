import 'package:dio/dio.dart';

abstract class GalleryIntoRemoteDataSource {
  Future<Response> getGalleryIntoList();
  Future<Response> getGalleryIntoOnly(String id);

}

class GalleryIntoRemoteDataSourceImpl implements GalleryIntoRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<Response> getGalleryIntoList() async {
    print("I am making API call to backend");
    Response response = await dio.get('https://jsonplaceholder.typicode.com/photos');
    print("I got data from backend");
    return response;
  }

  @override
  Future<Response> getGalleryIntoOnly(String id) async {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/photos/$id');
    return response;
  }
}