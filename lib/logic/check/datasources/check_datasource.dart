import 'package:dio/dio.dart';

abstract class CheckRemoteDataSource {
  Future<Response> getCheckList();
  Future<Response> getCheckOnly(String id);

}

class CheckRemoteDataSourceImpl implements CheckRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<Response> getCheckList() async {
    print("I am making API call to backend");
    Response response = await dio.get('https://jsonplaceholder.typicode.com/todos');
    print("I got data from backend");
    return response;
  }

  @override
  Future<Response> getCheckOnly(String id) async {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/todos/$id');
    return response;
  }
}