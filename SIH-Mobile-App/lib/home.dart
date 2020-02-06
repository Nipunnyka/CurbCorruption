import 'package:flutter/material.dart';
import 'map.dart';
import 'form.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    Map(),
    Map(),
    FormPage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)]
        ),
        child: BottomNavigationBar(
          //backgroundColor: Color(0xff4a4e4d),
          onTap: onTabTapped, // new
          currentIndex: _currentIndex, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Map'),
            ),

            BottomNavigationBarItem(
              icon: new Icon(Icons.panorama_fish_eye),
              title: new Text('FAQ'),
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                title: Text('Add')
            )
          ],
        ),
      ),
    );
  }
}
