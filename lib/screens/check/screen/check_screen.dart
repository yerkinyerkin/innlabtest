import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../logic/check/models/check_model.dart';




class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  _CheckScreenState createState() => _CheckScreenState();
}



class _CheckScreenState extends State<CheckScreen> {
  Map<int,bool> m= {};


  Future<List<CheckModel>> getCheckList() async {
    Response response = await Dio().get('https://jsonplaceholder.typicode.com/todos');
    List<CheckModel> checkList = (response.data as List)
        .map((data) =>  CheckModel.fromJson(data))
        .toList();


    return checkList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check",textAlign: TextAlign.center,),
        backgroundColor: Color(0xff322C54),
      ),
      backgroundColor: Color(0xff0F0B21),
      body: FutureBuilder(
        future: getCheckList(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            List checkList = snapshot.data as List;
            if(m.isEmpty) {
              for(int i = 0; i < checkList.length; i++){
                m[checkList[i].id] = checkList[i].completed;
              }
            }

            return ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: checkList.length,
              itemBuilder: (BuildContext context,int index){
                return Container(
                  color: m[checkList[index].id] == true ? Color(0XFF6C63FF) : Color(0XFF0F0B21),
                  child: Row(
                    children: [
                      Checkbox(
                        hoverColor: Colors.white,
                        value: m[checkList[index].id]!,
                        onChanged: (value) {
                          setState(() {
                            m[checkList[index].id] = !m[checkList[index].id]!;
                          });
                        },
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 78,
                        child: Text(
                          '${checkList[index].title}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
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


