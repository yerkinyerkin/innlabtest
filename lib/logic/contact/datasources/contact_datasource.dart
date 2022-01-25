import 'package:dio/dio.dart';

abstract class ContactRemoteDataSource {
  Future<Response> getContactList();
  Future<Response> getContactOnly(String id);

}

class ContactRemoteDataSourceImpl implements ContactRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<Response> getContactList() async {
    print("I am making API call to backend");
    Response response = await dio.get('https://jsonplaceholder.typicode.com/users');
    print("I got data from backend");
    return response;
  }

  @override
  Future<Response> getContactOnly(String id) async {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/users/$id');
    return response;
  }
}