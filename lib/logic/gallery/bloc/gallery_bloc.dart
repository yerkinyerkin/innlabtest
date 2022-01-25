import 'package:bloc/bloc.dart';
import 'package:innlabtest/logic/gallery/models/gallery_model.dart';
import 'package:innlabtest/logic/gallery/repositories/gallery_repository.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final GalleryRemoteRepository galleryRemoteRepository;

  GalleryBloc(this.galleryRemoteRepository) : super(GalleryInitial());

  @override
  Stream<GalleryState> mapEventToState(GalleryEvent event) async* {
    if (event is PleaseLoadGalleryList) {
      print("I am changing state to LOADING!");
      yield GalleryLoading();
      try {
        final List<GalleryModel> galleryList = await galleryRemoteRepository.getGalleryList();
        print("I am changing state to SUCCESS!");
        yield GallerySuccess(galleryList);
      }
      catch (e) {
        print("I am changing state to FAILURE!");
        yield GalleryFailure(e.toString());
      }
    }
  }
}
