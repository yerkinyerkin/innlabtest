import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlabtest/core/const/color_styles.dart';
import 'package:innlabtest/core/injection_container.dart';
import 'package:innlabtest/logic/news/bloc/news_bloc.dart';
import 'package:innlabtest/logic/news/models/news_model.dart';
import 'package:innlabtest/screens/news/screen/news_into_screen.dart';


class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<NewsScreen> {
  void _navigateToNextScreen(BuildContext context,NewsModel news,int id){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsIntoScreen(news: news, id: id)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<NewsBloc>()..add(PleaseLoadNewsList()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("News",textAlign: TextAlign.center),
          backgroundColor: Color(0xff322C54),
        ),
        backgroundColor: Color(0xff0F0B21),
        body: BlocBuilder<NewsBloc,NewsState>(
          builder: (context, state) {
            if(state is NewsInitial) {
              return Center(
                child: Text(
                    "Initial State, али дым загружать еткен жокпыз",
                  style: TextStyle(
                    color: ColorStyles.whiteColor,
                  ),
                ),
              );
            }
            if(state is NewsLoading) {
              return Center(
                child: CupertinoActivityIndicator(radius: 40),
              );
            }
            if(state is NewsSuccess) {
              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: state.newsList.length,
                itemBuilder: (BuildContext context,int index){
                  return Container(
                    constraints: BoxConstraints(
                      minHeight: 140,
                    ),
                    child: GestureDetector(
                      onTap: (){
                        _navigateToNextScreen(context,state.newsList[index],state.newsList[index].id);
                      },
                      child: Card(
                        color: ColorStyles.newsCardColor,
                        child: Column(
                          children: [
                            SizedBox(height: 8,),
                            Text(
                              '${state.newsList[index].title}',
                              style: TextStyle(
                                color: ColorStyles.whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16,),
                            Text(
                              '${state.newsList[index].body}',
                              style: TextStyle(
                                color: ColorStyles.whiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            if(state is NewsFailure) {

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
