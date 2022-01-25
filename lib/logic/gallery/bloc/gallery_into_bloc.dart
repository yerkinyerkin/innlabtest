import 'package:bloc/bloc.dart';
import 'package:innlabtest/logic/gallery/models/gallery_into_model.dart';
import 'package:innlabtest/logic/gallery/repositories/gallery_into_repository.dart';


part 'gallery_into_event.dart';
part 'gallery_into_state.dart';

class GalleryIntoBloc extends Bloc<GalleryIntoEvent, GalleryIntoState> {
  final GalleryIntoRemoteRepository galleryIntoRemoteRepository;

  GalleryIntoBloc(this.galleryIntoRemoteRepository) : super(GalleryIntoInitial());

  @override
  Stream<GalleryIntoState> mapEventToState(GalleryIntoEvent event) async* {
    if (event is PleaseLoadGalleryIntoList) {
      print("I am changing state to LOADING!");
      yield GalleryIntoLoading();
      try {
        final List<GalleryIntoModel> galleryIntoList = await galleryIntoRemoteRepository.getGalleryIntoList();
        print("I am changing state to SUCCESS!");
        yield GalleryIntoSuccess(galleryIntoList);
      }
      catch (e) {
        print("I am changing state to FAILURE!");
        yield GalleryIntoFailure(e.toString());
      }
    }
  }
}
