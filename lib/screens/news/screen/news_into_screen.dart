import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innlabtest/logic/news/models/news_model.dart';
import 'package:innlabtest/logic/news/models/news_into_model.dart';

class NewsIntoScreen extends StatefulWidget {
  final NewsModel news;
  final int id;
  const NewsIntoScreen({Key? key,required this.news,required this.id}) : super(key: key);

  @override
  _NewsIntoState createState() => _NewsIntoState();
}

class _NewsIntoState extends State<NewsIntoScreen> {
  bool hideButton = false;

  Future<List<NewsIntoModel>> getNewsList() async {
    Response response = await Dio().get('https://jsonplaceholder.typicode.com/comments');
    List<NewsIntoModel> newsIntoList = (response.data as List)
        .map((data) =>  NewsIntoModel.fromJson(data))
        .toList();


    return newsIntoList;
  }

  void showComment(){
    setState(() {
      hideButton = !hideButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News",textAlign: TextAlign.center),
        backgroundColor: Color(0xff322C54),
      ),
      backgroundColor: Color(0xff0F0B21),
      body: FutureBuilder(
        future: getNewsList(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<NewsIntoModel> newsIntoList = snapshot.data as List<NewsIntoModel>;
            List<NewsIntoModel> equalID = newsIntoList.where((element) => element.postId == widget.id).toList();
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                          child: Column(
                            children: [
                              Text(
                                  "${widget.news.title}"
                              ),
                              Text(
                                  "${widget.news.body}"
                              )
                            ],
                          ),
                    ),
                    Container(
                      child: hideButton == false ? (ListView.builder(
                        padding: const EdgeInsets.all(5),
                        itemCount: 2,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context,int index){
                          return Card(
                            child: Column(children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.account_circle_rounded,
                                    size: 50,
                                  ),
                                  Text(
                                    "${equalID[index].name}",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Text(
                                "${equalID[index].body}",
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis
                                ),
                              ),
                            ],
                            ),
                          );
                        },
                      )) : (ListView.builder(
                        padding: const EdgeInsets.all(5),
                        itemCount: equalID.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context,int index){
                          return Card(
                            child: Column(children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.account_circle_rounded,
                                    size: 50,
                                  ),
                                  Text(
                                    "${equalID[index].name}",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              Text(
                                "${equalID[index].body}",
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis
                                ),
                              ),
                            ],
                            ),
                          );
                        },
                      ))
                    ),
                  CupertinoButton(child: Container(
                    child: Row(
                      children: [
                        Text("${hideButton == false ? "Show " : "Hide"} ${hideButton == false ? "me ${equalID.length} results" : " results"} "),
                        Icon(
                          Icons.remove_red_eye
                        ),
                      ],
                    ),
                  ), onPressed: (){
                    showComment();
                  })
                  ],
                ),
              ),

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
