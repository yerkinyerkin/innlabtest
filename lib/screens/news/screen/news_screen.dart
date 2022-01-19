import 'package:flutter/material.dart';
import 'package:innlabtest/logic/news/models/news_model.dart';
import 'package:dio/dio.dart';
import 'package:innlabtest/screens/news/screen/news_into_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<NewsScreen> {

  Future<List<NewsModel>> getNewsList() async {
    Response response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
    List<NewsModel> newsList = (response.data as List)
        .map((data) =>  NewsModel.fromJson(data))
        .toList();


    return newsList;
  }

  void _navigateToNextScreen(BuildContext context, NewsModel news,int id) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsIntoScreen(news:news,id:id)) );
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
        future: getNewsList(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<NewsModel> newsList = snapshot.data as List<NewsModel>;
            return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: newsList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: GestureDetector(
                      onTap: (){
                        _navigateToNextScreen(context, newsList[index],newsList[index].id);
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Text(
                                "${newsList[index].title}"
                            ),
                            Text(
                                "${newsList[index].body}"
                            ),
                          ],
                        ),
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
