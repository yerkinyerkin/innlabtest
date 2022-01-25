import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlabtest/core/const/color_styles.dart';
import 'package:innlabtest/core/injection_container.dart';
import 'package:innlabtest/logic/contact/bloc/contact_bloc.dart';
import 'package:innlabtest/logic/contact/models/contact_model.dart';
import 'package:innlabtest/screens/contact/screen/contacts_into_screen.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();

}
class _ContactsState extends State<Contacts> {


  void _navigateToNextScreen(BuildContext context, ContactModel contact) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactsInto(contact:contact)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ContactBloc>()..add(PleaseLoadContactList()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Contacts",textAlign: TextAlign.center),
          backgroundColor: Color(0xff322C54),
        ),
        backgroundColor: Color(0xff0F0B21),
        body: BlocBuilder<ContactBloc,ContactState>(
          builder: (context, state) {
            if(state is ContactInitial) {
              return Center(
                child: Text(
                    "Initial State, али дым загружать еткен жокпыз"
                ),
              );
            }
            if(state is ContactLoading) {
              return Center(
                child: CupertinoActivityIndicator(radius: 40),
              );
            }
            if(state is ContactSuccess) {
              return ListView.builder(
                itemCount: state.contactList.length,
                itemBuilder: (BuildContext context,int index){
                    return Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                      child: GestureDetector(
                        onTap: (){
                          _navigateToNextScreen(context, state.contactList[index]);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_circle_rounded,
                              color: ColorStyles.whiteColor,
                              size: 50,
                            ),
                            SizedBox(width: 10,),
                            Text(
                              '${state.contactList[index].name}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                },
              );
            }
            if(state is ContactFailure) {

              return Center(
                child: Text(
                    state.errorMessage
                ),
              );
            }
            return Offstage();
          },
        )
      ),
    );
  }
}
