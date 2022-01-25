import 'package:flutter/material.dart';
import 'package:innlabtest/logic/contact/models/contact_model.dart';


class ContactsInto extends StatefulWidget {
  final ContactModel contact;
  const ContactsInto({Key? key,required this.contact}) : super(key: key);

  @override
  _ContactsIntoState createState() => _ContactsIntoState();
}


class _ContactsIntoState extends State<ContactsInto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts", textAlign: TextAlign.center),
        backgroundColor: Color(0xff322C54),
      ),
      backgroundColor: Color(0xff0F0B21),
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://wallpapercave.com/wp/wp2587127.jpg"),
                  ),
                ),
                SizedBox(height: 20,),
                Text("${widget.contact.name}",
                  style: TextStyle(color: Colors.white, fontSize: 20),),
                SizedBox(height: 20,),
                Text("${widget.contact.email}",
                  style: TextStyle(color: Colors.white, fontSize: 14),),
                SizedBox(height: 20,),
                TextField(
                  onChanged: (text) {
                    print("${text}");
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "${widget.contact.email}",
                    labelStyle: new TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  onChanged: (text) {
                    print("${text}");
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "${widget.contact.phone}",
                    labelStyle: new TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  onChanged: (text) {
                    print("${text}");
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "${widget.contact.website}",
                    labelStyle: new TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  onChanged: (text) {
                    print("${text}");
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "${widget.contact.company.name}",
                    labelStyle: new TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  onChanged: (text) {
                    print("${text}");
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "${widget.contact.address.street}",
                    labelStyle: new TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}





