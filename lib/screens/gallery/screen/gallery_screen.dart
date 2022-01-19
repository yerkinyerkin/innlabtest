import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innlabtest/logic/gallery/models/gallery_model.dart';
import 'package:dio/dio.dart';
import 'package:innlabtest/screens/gallery/screen/gallery_into_screen.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  Future<List<GalleryModel>> getGalleryAlbum() async {
    Response response = await Dio().get(
        'https://jsonplaceholder.typicode.com/albums');
    List<GalleryModel> albumList = (response.data as List)
        .map((data) => GalleryModel.fromJson(data))
        .toList();


    return albumList;
  }

  void _navigateToNextScreen(BuildContext context, int id) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => GalleryIntoScreen(id: id,)));
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
        future: getGalleryAlbum(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List albumList = snapshot.data as List;
                  return GridView.count(
                    padding: const EdgeInsets.all(5),
                    crossAxisSpacing: 20,
                    crossAxisCount: 2,
                    children: List.generate(albumList.length, (index) {
                      return Center(
                        child: Column(
                          children: [
                            Container(
                              child: CupertinoButton(
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
                                          '${albumList[index].title}',
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
                                onPressed: () {
                                  _navigateToNextScreen(context, albumList[index].id);
                                },
                              )
                            ),
                            SizedBox(height: 10),
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
