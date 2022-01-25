import 'package:dio/dio.dart';
import 'package:innlabtest/logic/news/datasources/news_into_datasource.dart';
import 'package:innlabtest/logic/news/models/news_into_model.dart';


abstract class NewsIntoRemoteRepository {
  Future<List<NewsIntoModel>> getNewsIntoList();
  Future<NewsIntoModel> getNewsIntoOnly(String id);
}

class NewsIntoRemoteRepositoryImpl implements NewsIntoRemoteRepository {
  final NewsIntoRemoteDataSource newsIntoRemoteDataSource;

  NewsIntoRemoteRepositoryImpl(this.newsIntoRemoteDataSource);

  @override
  Future<List<NewsIntoModel>> getNewsIntoList() async {
    print("I am calling datasource function to get user list");
    Response response = await newsIntoRemoteDataSource.getNewsIntoList();
    print("I am converting data to user model");
    return (response.data as List).map((i) => NewsIntoModel.fromJson(i)).toList();
  }

  @override
  Future<NewsIntoModel> getNewsIntoOnly(String id) async {
    Response response = await newsIntoRemoteDataSource.getNewsIntoOnly(id);
    return NewsIntoModel.fromJson(response.data);
  }
}