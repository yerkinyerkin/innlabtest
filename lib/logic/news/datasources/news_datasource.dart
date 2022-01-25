import 'package:dio/dio.dart';

abstract class NewsRemoteDataSource {
  Future<Response> getNewsList();
  Future<Response> getNewsOnly(String id);

}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<Response> getNewsList() async {
    print("I am making API call to backend");
    Response response = await dio.get('https://jsonplaceholder.typicode.com/posts');
    print("I got data from backend");
    return response;
  }

  @override
  Future<Response> getNewsOnly(String id) async {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/posts/$id');
    return response;
  }
}