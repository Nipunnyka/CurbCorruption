import 'package:flutter/material.dart';

class PaidForm extends StatefulWidget {
  @override
  _PaidFormState createState() => _PaidFormState();
}

class _PaidFormState extends State<PaidForm> {

  String id, pass;

  getLoginId(id) {
    this.id = id;
  }

  Widget field(String s){
    return Container(
      width: 350,
      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
      child: TextField(
        onChanged: (String logIn) {
          getLoginId(logIn);
        },

        obscureText: false,
        //style: style.copyWith(fontSize: 14.0),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 20.0, 15.0),
            hintText: "$s",
            hintStyle: TextStyle(color: Color(0xff999999)),
            //fillColor: Color(0xfffafafa),
            //filled: true
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Container(
          child: Card(
            elevation: 5.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
              SizedBox(
                height: 10,
              ),
                field('Choose the service'),
                SizedBox(
                  height: 20,
                ),
                field('City'),
                SizedBox(
                  height: 20,
                ),
                field('Why were you asked a bribe'),
                SizedBox(
                  height: 20,
                ),
                field('When did it happen'),
                SizedBox(
                  height: 20,
                ),
                field('Enter the title of your report'),
                SizedBox(
                  height: 20,
                ),
                field('Describe your experience'),
                SizedBox(
                  height: 50,
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                    child: Material(
                      //elevation: 5.0,
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.lightBlue,
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width-200,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () {
//                    Navigator.push(context,
//                        MaterialPageRoute(builder: (context) => PaidForm()));
                        },
                        child: Text("Submit",
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
                  height: 20,
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
