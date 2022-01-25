import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlabtest/logic/check/bloc/check_bloc.dart';

import '../../../core/injection_container.dart';





class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  _CheckScreenState createState() => _CheckScreenState();
}



class _CheckScreenState extends State<CheckScreen> {
  Map<int,bool> m= {};



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CheckBloc>()..add(PleaseLoadCheckList()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Check",textAlign: TextAlign.center,),
          backgroundColor: Color(0xff322C54),
        ),
        backgroundColor: Color(0xff0F0B21),
        body: BlocBuilder<CheckBloc, CheckState>(
          builder: (context, state) {
            if(state is CheckInitial) {
              return Center(
                child: Text(
                    "Initial State, али дым загружать еткен жокпыз"
                ),
              );
            }
            if(state is CheckLoading) {
              return Center(
                child: CupertinoActivityIndicator(radius: 40),
              );
            }
            if(state is CheckSuccess) {
              if(m.isEmpty){
                  for(int i = 0; i < state.checkList.length; i++){
                    m[state.checkList[i].id] = state.checkList[i].completed;
                  }
              }
              return ListView.builder(
                  itemCount: state.checkList.length,
                  itemBuilder: (BuildContext context,int index){
                      return Container(
                        color: m[state.checkList[index].id] == true ? Color(0XFF6C63FF) : Color(0XFF0F0B21),
                        child: Row(
                          children: [
                            Checkbox(
                              hoverColor: Colors.white,
                              value: m[state.checkList[index].id]!,
                              onChanged: (value){
                                setState(() {
                                  m[state.checkList[index].id] == !m[state.checkList[index].id]!;
                                });
                              },
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 78,
                              child: Text(
                                "${state.checkList[index].title}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                  },
              );
            }
            if(state is CheckFailure) {

              return Center(
                child: Text(
                    state.errorMessage
                ),
              );
            }
            return Offstage();
          },
        ),
      ),
    );
  }
}


