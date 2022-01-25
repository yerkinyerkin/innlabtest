import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlabtest/core/const/color_styles.dart';
import 'package:innlabtest/core/injection_container.dart';
import 'package:innlabtest/logic/news/bloc/news_into_bloc.dart';
import 'package:innlabtest/logic/news/models/news_into_model.dart';
import 'package:innlabtest/logic/news/models/news_model.dart';

class NewsIntoScreen extends StatefulWidget {
  final NewsModel news;
  final int id;
  const NewsIntoScreen({Key? key,required this.news,required this.id}) : super(key: key);

  @override
  _NewsIntoState createState() => _NewsIntoState();
}

class _NewsIntoState extends State<NewsIntoScreen> {
  bool hideButton = false;

  void showComment(){
    setState(() {
      hideButton = !hideButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NewsIntoBloc>()..add(PleaseLoadNewsIntoList()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("News",textAlign: TextAlign.center),
          backgroundColor: Color(0xff322C54),
        ),
        backgroundColor: Color(0xff0F0B21),
        body: BlocBuilder<NewsIntoBloc,NewsIntoState>(
          builder: (context, state) {
            if(state is NewsIntoInitial) {
              return Center(
                child: Text(
                    "Initial State, али дым загружать еткен жокпыз"
                ),
              );
            }
            if(state is NewsIntoLoading) {
              return Center(
                child: CupertinoActivityIndicator(radius: 40),
              );
            }
            if(state is NewsIntoSuccess) {
              List<NewsIntoModel> equalID = state.newsIntoList.where((element) => element.postId == widget.id).toList();
              return Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Text(
                              '${widget.news.title}',
                              style: TextStyle(
                                color: ColorStyles.whiteColor,
                                fontSize: 16,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                                '${widget.news.body}',
                              style: TextStyle(
                                color: ColorStyles.whiteColor,
                                fontSize: 14,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                            SizedBox(height: 20,),
                          ],
                        ),
                      ),
                      Container(
                          constraints: BoxConstraints(
                            minHeight: 200,
                          ),
                          child: hideButton == false ?  (
                          ListView.builder(
                            padding: const EdgeInsets.all(5),
                            itemCount: 2,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context,int index){
                              return Card(
                                color: ColorStyles.newsCardColor,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.account_circle_rounded,
                                          size: 50,
                                        ),
                                        Text(
                                          '${equalID[index].name}',
                                          style: TextStyle(
                                            color: ColorStyles.whiteColor,
                                            overflow: TextOverflow.ellipsis
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      '${equalID[index].body}',
                                      style: TextStyle(
                                          color: ColorStyles.whiteColor,
                                          overflow: TextOverflow.ellipsis
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        ) : (
                        ListView.builder(
                          padding: const EdgeInsets.all(5),
                          itemCount: equalID.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context,int index){
                             return Card(
                               color: ColorStyles.newsCardColor,
                               child: Column(
                                 children: [
                                   Row(
                                     children: [
                                       Icon(
                                         Icons.account_circle_rounded,
                                         size:50,
                                       ),
                                       Text(
                                         '${equalID[index].name}',
                                         style: TextStyle(
                                             color: ColorStyles.whiteColor,
                                             overflow: TextOverflow.ellipsis
                                         ),
                                       ),
                                     ],
                                   ),
                                   SizedBox(height: 20),
                                   Text(
                                     '${equalID[index].body}',
                                     style: TextStyle(
                                         color: ColorStyles.whiteColor,
                                         overflow: TextOverflow.ellipsis
                                     ),
                                   ),
                                 ],
                               ),
                             );
                          },
                        )
                        )
                      ),
                      CupertinoButton(
                        onPressed: () {
                          showComment();
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                  '${hideButton == false ? "Show" : "Hide"} ${hideButton == false ? "me ${equalID.length} comments " : "till 2 comments"}'
                              ),
                              Icon(
                                Icons.remove_red_eye
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if(state is NewsIntoFailure) {

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
