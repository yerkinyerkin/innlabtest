import 'package:bloc/bloc.dart';
import 'package:innlabtest/logic/contact/models/contact_model.dart';
import 'package:innlabtest/logic/contact/repositories/contact_repository.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRemoteRepository contactRemoteRepository;

  ContactBloc(this.contactRemoteRepository) : super(ContactInitial());

  @override
  Stream<ContactState> mapEventToState(ContactEvent event) async* {
    if (event is PleaseLoadContactList) {
      print("I am changing state to LOADING!");
      yield ContactLoading();
      try {
        final List<ContactModel> contactList = await contactRemoteRepository.getContactList();
        print("I am changing state to SUCCESS!");
        yield ContactSuccess(contactList);
      }
      catch (e) {
        print("I am changing state to FAILURE!");
        yield ContactFailure(e.toString());
      }
    }
  }
}