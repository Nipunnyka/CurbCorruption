import 'package:flutter/material.dart';
import 'paid.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'dart:convert';
import 'package:http/http.dart' as http;


class FormPage extends StatefulWidget {
  final String pageName;

  const FormPage({Key key, this.pageName}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {



  //////////////////////////////////////////////////////////

  List<Name> _names = new List();
  List<Widget> _namesTiles = new List();
  String uriString =
      "mongodb://DATABASESERVER:27017/rpc1";
  String collectionName = "names";

  @override
  void initState() {
    super.initState();
    _getNames();
  }

  _getNames() async {
    mongo.Db db = new mongo.Db(uriString);
    var collection = db.collection(collectionName);
    await db.open();
    await collection.find().forEach((map) {
      Name name = new Name()
        ..firstName = map['firstName']
        ..lastName = map['lastName'];
      _names.add(name);
    });
//    http.Response response = await http.get("http://SERVICEIP:8000/list");
//    String body = response.body;
//    List data = jsonDecode(body);
//    for (Map raw in data) {
//      Name name = new Name()
//        ..firstName = raw['firstName']
//        ..lastName = raw['lastName'];
//      //       print("Received $name");
//      _names.add(name);
//    }
    //   print("received $_names");

    setState(() {
      for (Name found in _names) {
        Text text = new Text("$found");
        _namesTiles.add(text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.lightBlue,
//        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: Material(
                    //elevation: 5.0,
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.lightBlue,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PaidForm()));
                      },
                      child: Text("I paid a bribe",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                            fontFamily: 'GoogleSans'
                        ),
                      ),
                    ),
                  )
              ),

              SizedBox(
                height: 30,
              ),

              Container(
                  padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: Material(
                    //elevation: 5.0,
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.lightBlue,
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => PaidForm()));

                      },
                      child: Text("I refused to pay a bribe",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'GoogleSans'
                        ),
                      ),
                    ),
                  )
              )
            ],
          ),
        )
//      ListView.builder(
//        itemBuilder: (context, index) => _namesTiles[index],
//        itemCount: _namesTiles.length,
//      ),
    );
  }
}

class Name {
  String firstName='a';
  String lastName='a';

  @override
  String toString() {
    // TODO: implement toString
    return "$firstName $lastName";
  }
}