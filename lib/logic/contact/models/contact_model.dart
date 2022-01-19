import 'package:innlabtest/logic/contact/models/address_model.dart';
import 'package:innlabtest/logic/contact/models/company_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_model.g.dart';

@JsonSerializable()
class ContactModel {

  final int id;
  final String name;
  final String username;
  final String email;
  final AddressModel address;
  final String phone;
  final String website;
  final CompanyModel company;


  ContactModel({required this.id,required this.name,required this.username,required this.email,required this.address,required this.phone,required this.website,required this.company});

  factory ContactModel.fromJson(Map<String, dynamic> json) => _$ContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}