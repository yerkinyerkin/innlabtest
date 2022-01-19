import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innlabtest/logic/gallery/models/gallery_into_model.dart';
import 'package:dio/dio.dart';

class GalleryIntoScreen extends StatefulWidget {
  final int id;

  const GalleryIntoScreen({Key? key, required this.id}) : super(key: key);
  @override
  _GalleryIntoScreenState createState() => _GalleryIntoScreenState();
}

class _GalleryIntoScreenState extends State<GalleryIntoScreen> {

  Future<List<GalleryIntoModel>> getGalleryPhotos() async {
    Response response = await Dio().get(
        'https://jsonplaceholder.typicode.com/photos');
    List<GalleryIntoModel> photoList = (response.data as List)
        .map((data) => GalleryIntoModel.fromJson(data))
        .toList();


    return photoList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery",textAlign: TextAlign.center,),
        backgroundColor: Color(0xff322C54),
      ),
      backgroundColor: Color(0xff0F0B21),
      body: FutureBuilder(
        future: getGalleryPhotos(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<GalleryIntoModel> photoList = snapshot.data as List<GalleryIntoModel>;
            List<GalleryIntoModel> equalID = photoList.where((element) => element.albumId == widget.id).toList();
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
                            fit: BoxFit.cover),
                        Positioned(
                          bottom: 10,

                          child: Container(
                            // color: Colors.black54,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '${equalID[index].title}',
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
                  );
                }),
              );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }
}
