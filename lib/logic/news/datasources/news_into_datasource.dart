import 'package:dio/dio.dart';

abstract class NewsIntoRemoteDataSource {
  Future<Response> getNewsIntoList();
  Future<Response> getNewsIntoOnly(String id);

}

class NewsIntoRemoteDataSourceImpl implements NewsIntoRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<Response> getNewsIntoList() async {
    print("I am making API call to backend");
    Response response = await dio.get('https://jsonplaceholder.typicode.com/comments');
    print("I got data from backend");
    return response;
  }

  @override
  Future<Response> getNewsIntoOnly(String id) async {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/comments/$id');
    return response;
  }
}