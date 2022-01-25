import 'package:dio/dio.dart';
import 'package:innlabtest/logic/news/datasources/news_datasource.dart';
import 'package:innlabtest/logic/news/models/news_model.dart';

abstract class NewsRemoteRepository {
  Future<List<NewsModel>> getCheckList();
  Future<NewsModel> getCheckOnly(String id);
}

class NewsRemoteRepositoryImpl implements NewsRemoteRepository {
  final NewsRemoteDataSource newsRemoteDataSource;

  NewsRemoteRepositoryImpl(this.newsRemoteDataSource);

  @override
  Future<List<NewsModel>> getCheckList() async {
    print("I am calling datasource function to get user list");
    Response response = await newsRemoteDataSource.getNewsList();
    print("I am converting data to user model");
    return (response.data as List).map((i) => NewsModel.fromJson(i)).toList();
  }

  @override
  Future<NewsModel> getCheckOnly(String id) async {
    Response response = await newsRemoteDataSource.getNewsOnly(id);
    return NewsModel.fromJson(response.data);
  }
}