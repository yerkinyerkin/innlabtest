import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlabtest/core/const/color_styles.dart';
import 'package:innlabtest/logic/gallery/bloc/gallery_bloc.dart';
import 'package:innlabtest/screens/gallery/screen/gallery_into_screen.dart';


import '../../../core/injection_container.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {


  void _navigateToNextScreen(BuildContext context, int id) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => GalleryIntoScreen(id: id,)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GalleryBloc>() ..add(PleaseLoadGalleryList()),
      child: Scaffold(
          appBar: AppBar(
            title: Text("Gallery",textAlign: TextAlign.center,),
            backgroundColor: Color(0xff322C54),
          ),
        backgroundColor: ColorStyles.backgroundColor,
        body: BlocBuilder<GalleryBloc,GalleryState>(
          builder: (context,state){
            if(state is GalleryInitial) {
              return Center(
                child: Text(
                    "Initial State, али дым загружать еткен жокпыз"
                ),
              );
            }
            if(state is GalleryLoading) {
              return Center(
                child: CupertinoActivityIndicator(radius: 40),
              );
            }
            if(state is GallerySuccess) {
              return GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  children: List.generate(state.galleryList.length, (index) {
                    return Center(
                      child: Column(
                        children: [
                          Container(
                            child: CupertinoButton(
                              onPressed: (){
                                _navigateToNextScreen(context, state.galleryList[index].id);
                              },
                              child: Stack(
                                children: [
                                  Image.asset('assets/images/photo.jpg',
                                  height: 140,
                                  fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        '${state.galleryList[index].title}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          overflow: TextOverflow.ellipsis
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10,)
                        ],
                      ),
                    );
                  }),
              );
            }
            if(state is GalleryFailure) {

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
