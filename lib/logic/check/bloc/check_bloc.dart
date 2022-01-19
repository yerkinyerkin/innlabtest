import 'package:bloc/bloc.dart';
import 'package:innlabtest/logic/check/models/check_model.dart';
import 'package:innlabtest/logic/check/repositories/check_repository.dart';

part 'check_event.dart';
part 'check_state.dart';

class CheckBloc extends Bloc<CheckEvent, CheckState> {
  final CheckRemoteRepository checkRemoteRepository;

  CheckBloc(this.checkRemoteRepository) : super(CheckInitial());

  @override
  Stream<CheckState> mapEventToState(CheckEvent event) async* {
    if (event is PleaseLoadCheckList) {
      print("I am changing state to LOADING!");
      yield CheckLoading();
      try {
        final List<CheckModel> checkList = await checkRemoteRepository.getCheckList();
        print("I am changing state to SUCCESS!");
        yield CheckSuccess(checkList);
      }
      catch (e) {
        print("I am changing state to FAILURE!");
        yield CheckFailure(e.toString());
      }
    }
  }
}
