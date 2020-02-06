import 'package:flutter/material.dart';


class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  var myColor= Colors.transparent;

  void namer(String s){
    setState(() {
      sName=s;
    });
  }

  String sName='Delhi';

  Widget mBody(){
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          Image(
            image: AssetImage('images/tMap.png'),
            fit: BoxFit.fill, // use this
          ),
          Positioned(
            right: 20,
            top: 0,
            child: Text('Curb\nCorruption!',
            style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 35.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'GoogleSans'
            ),),
          ),
          Positioned(
            left: 100,
            top: 225,
            child: GestureDetector(
              child: Container(
                height: 30,
                width: 90,
                color: myColor,
              ),
              onTap: () {
                namer('Madhya Pradesh');
              },
            ),
          ),

          Positioned(
            left: 80,
            top: 270,
            child: GestureDetector(
              child: Container(
                height: 30,
                width: 70,
                color: myColor,
              ),
              onTap: () {
                namer('Maharashtra');
              },
            ),
          ),

          Positioned(
            left: 50,
            top: 170,
            child: GestureDetector(
              child: Container(
                height: 30,
                width: 70,
                color: myColor,
              ),
              onTap: () {
                namer('Rajasthan');
              },
            ),
          ),

          Positioned(
            left: 85,
            top: 55,
            child: GestureDetector(
              child: Container(
                height: 30,
                width: 70,
                color: myColor,
              ),
              onTap: () {
                namer('Jammu & Kashmir');
              },
            ),
          ),

          Positioned(
            left: 150,
            top: 170,
            child: GestureDetector(
              child: Container(
                height: 30,
                width: 70,
                color: myColor,
              ),
              onTap: () {
                namer('Uttar Pradesh');
              },
            ),
          ),

          Positioned(
            left: 223,
            top: 175,
            child: GestureDetector(
              child: Container(
                height: 30,
                width: 50,
                color: myColor,
              ),
              onTap: () {
                namer('Bihar');
              },
            ),
          ),

          Positioned(
            left: 228,
            top: 220,
            child: GestureDetector(
              child: Container(
                height: 20,
                width: 20,
                color: myColor,
              ),
              onTap: () {
                namer('Jharkhand');
              },
            ),
          ),

          Positioned(
            right: 65,
            bottom: 0,
            child: Card(
              elevation: 3.0,
              child: Container(
                width: 150,
                height: 170,
                padding: EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 40.0),
                child: Text("$sName",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                        fontFamily: 'GoogleSans')
                ),
              )
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: mBody(),
    );
  }
}
