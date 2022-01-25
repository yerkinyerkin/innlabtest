import 'package:dio/dio.dart';
import 'package:innlabtest/logic/check/datasources/check_datasource.dart';
import 'package:innlabtest/logic/check/models/check_model.dart';

abstract class CheckRemoteRepository {
  Future<List<CheckModel>> getCheckList();
  Future<CheckModel> getCheckOnly(String id);
}

class CheckRemoteRepositoryImpl implements CheckRemoteRepository {
  final CheckRemoteDataSource checkRemoteDataSource;

  CheckRemoteRepositoryImpl(this.checkRemoteDataSource);

  @override
  Future<List<CheckModel>> getCheckList() async {
    print("I am calling datasource function to get user list");
    Response response = await checkRemoteDataSource.getCheckList();
    print("I am converting data to user model");
    return (response.data as List).map((i) => CheckModel.fromJson(i)).toList();
  }

  @override
  Future<CheckModel> getCheckOnly(String id) async {
    Response response = await checkRemoteDataSource.getCheckOnly(id);
    return CheckModel.fromJson(response.data);
  }
}