import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: News',
      style: optionStyle,
    ),
    Text(
      'Index 1: Gallery',
      style: optionStyle,
    ),
    Text(
      'Index 2: Check',
      style: optionStyle,
    ),
    Text(
      'Index 3: Contacts',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: (Text(
            "Check"
          )),
        ),
        backgroundColor: Color(0xff322C54),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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
            icon: Icon(Icons.favorite),
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
