import 'package:dio/dio.dart';
import 'package:innlabtest/logic/contact/datasources/contact_datasource.dart';
import 'package:innlabtest/logic/contact/models/contact_model.dart';

abstract class ContactRemoteRepository {
  Future<List<ContactModel>> getContactList();
  Future<ContactModel> getContactOnly(String id);
}

class ContactRemoteRepositoryImpl implements ContactRemoteRepository {
  final ContactRemoteDataSource contactRemoteDataSource;

  ContactRemoteRepositoryImpl(this.contactRemoteDataSource);

  @override
  Future<List<ContactModel>> getContactList() async {
    print("I am calling datasource function to get user list");
    Response response = await contactRemoteDataSource.getContactList();
    print("I am converting data to user model");
    return (response.data as List).map((i) => ContactModel.fromJson(i)).toList();
  }

  @override
  Future<ContactModel> getContactOnly(String id) async {
    Response response = await contactRemoteDataSource.getContactOnly(id);
    return ContactModel.fromJson(response.data);
  }
}