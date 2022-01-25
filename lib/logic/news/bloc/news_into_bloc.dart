import 'package:bloc/bloc.dart';
import 'package:innlabtest/logic/news/models/news_into_model.dart';
import 'package:innlabtest/logic/news/repositories/news_into_repository.dart';

part 'news_into_event.dart';
part 'news_into_state.dart';

class NewsIntoBloc extends Bloc<NewsIntoEvent, NewsIntoState> {
  final NewsIntoRemoteRepository newsIntoRemoteRepository;

  NewsIntoBloc(this.newsIntoRemoteRepository) : super(NewsIntoInitial());

  @override
  Stream<NewsIntoState> mapEventToState(NewsIntoEvent event) async* {
    if (event is PleaseLoadNewsIntoList) {
      print("I am changing state to LOADING!");
      yield NewsIntoLoading();
      try {
        final List<NewsIntoModel> newsIntoList = await newsIntoRemoteRepository.getNewsIntoList();
        print("I am changing state to SUCCESS!");
        yield NewsIntoSuccess(newsIntoList);
      }
      catch (e) {
        print("I am changing state to FAILURE!");
        yield NewsIntoFailure(e.toString());
      }
    }
  }
}
