part of 'news_into_bloc.dart';

abstract class NewsIntoState {}

class NewsIntoInitial extends NewsIntoState {}

class NewsIntoLoading extends NewsIntoState {}

class NewsIntoSuccess extends NewsIntoState {
  final List<NewsIntoModel> newsIntoList;


  NewsIntoSuccess(this.newsIntoList);

}

class NewsIntoFailure extends NewsIntoState {
  final String errorMessage;

  NewsIntoFailure(this.errorMessage);
}
