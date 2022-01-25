part of 'contact_bloc.dart';

abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactSuccess extends ContactState {
  final List<ContactModel> contactList;


  ContactSuccess(this.contactList);

}

class ContactFailure extends ContactState {
  final String errorMessage;

  ContactFailure(this.errorMessage);
}
