import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innlabtest/core/injection_container.dart';
import 'package:innlabtest/logic/gallery/bloc/gallery_bloc.dart';
import 'package:innlabtest/logic/gallery/bloc/gallery_into_bloc.dart';
import 'package:innlabtest/logic/gallery/models/gallery_into_model.dart';
import 'package:dio/dio.dart';

class GalleryIntoScreen extends StatefulWidget {
  final int id;

  const GalleryIntoScreen({Key? key, required this.id}) : super(key: key);
  @override
  _GalleryIntoScreenState createState() => _GalleryIntoScreenState();
}

class _GalleryIntoScreenState extends State<GalleryIntoScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GalleryIntoBloc>() ..add(PleaseLoadGalleryIntoList()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Gallery",textAlign: TextAlign.center,),
          backgroundColor: Color(0xff322C54),
        ),
        backgroundColor: Color(0xff0F0B21),
        body: BlocBuilder<GalleryIntoBloc,GalleryIntoState>(
          builder: (context,state){
            if(state is GalleryIntoInitial) {
              return Center(
                child: Text(
                    "Initial State, али дым загружать еткен жокпыз"
                ),
              );
            }
            if(state is GalleryIntoLoading) {
              return Center(
                child: CupertinoActivityIndicator(radius: 40),
              );
            }
            if(state is GalleryIntoSuccess) {
              List<GalleryIntoModel> equalID = state.galleryIntoList.where((element) => element.albumId == widget.id).toList();
              return GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                children: List.generate(equalID.length, (index) {
                  return Center(
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/photo.jpg',
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                        bottom: 10,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            '${equalID[index].title}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis
                            ),
                          ),
                        ),
                        ),
                      ],
                    ),
                  );
                }),
              );
            }
            if(state is GalleryIntoFailure) {

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
