import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:innlabtest/logic/contact/models/contact_model.dart';
import 'package:innlabtest/screens/contact/screen/contacts_into_screen.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();

}
class _ContactsState extends State<Contacts> {

  Future<List<ContactModel>> getContactList() async {
    Response response = await Dio().get('https://jsonplaceholder.typicode.com/users');
    List<ContactModel> contactList = (response.data as List)
        .map((data) =>  ContactModel.fromJson(data))
        .toList();


    return contactList;
  }

  void _navigateToNextScreen(BuildContext context, ContactModel contact) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactsInto(contact:contact)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts",textAlign: TextAlign.center),
        backgroundColor: Color(0xff322C54),
      ),
      backgroundColor: Color(0xff0F0B21),
      body: FutureBuilder(
        future: getContactList(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<ContactModel> contactList = snapshot.data as List<ContactModel>;
            return ListView.builder(
                itemCount: contactList.length,
                itemBuilder: (BuildContext context,int index){
                  return Container(
                    child: GestureDetector(
                      onTap: (){
                        _navigateToNextScreen(context, contactList[index]);
                      },
                      child: Row(
                        children: [
                          Icon(
                              Icons.account_circle_rounded,
                              size: 50,
                          ),
                          Text(
                            '${contactList[index].name}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
            );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
