import 'package:flutter/material.dart';
import 'package:innlabtest/screens/check/screen/check_screen.dart';
import 'package:innlabtest/screens/contact/screen/contacts_screen.dart';
import 'package:innlabtest/screens/gallery/screen/gallery_screen.dart';
import 'package:innlabtest/navigation_drawer_widget.dart';
import 'package:innlabtest/screens/news/screen/news_screen.dart';
import 'core/injection_container.dart';

void main(){
  initGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    NewsScreen(),
    GalleryScreen(),
    CheckScreen(),
    Contacts(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News',
            backgroundColor: Color(0xff322C54),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Gallery',
            backgroundColor: Color(0xff322C54),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Check',
            backgroundColor: Color(0xff322C54),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_contact_cal),
            label: 'Contacts',
            backgroundColor: Color(0xff322C54),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
