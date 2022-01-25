part of 'news_bloc.dart';

abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final List<NewsModel> newsList;


  NewsSuccess(this.newsList);

}

class NewsFailure extends NewsState {
  final String errorMessage;

  NewsFailure(this.errorMessage);
}
