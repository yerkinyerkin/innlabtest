import 'package:bloc/bloc.dart';
import 'package:innlabtest/logic/news/models/news_model.dart';
import 'package:innlabtest/logic/news/repositories/news_repository.dart';


part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRemoteRepository newsRemoteRepository;

  NewsBloc(this.newsRemoteRepository) : super(NewsInitial());

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    if (event is PleaseLoadNewsList) {
      print("I am changing state to LOADING!");
      yield NewsLoading();
      try {
        final List<NewsModel> newsList = await newsRemoteRepository.getCheckList();
        print("I am changing state to SUCCESS!");
        yield NewsSuccess(newsList);
      }
      catch (e) {
        print("I am changing state to FAILURE!");
        yield NewsFailure(e.toString());
      }
    }
  }
}
