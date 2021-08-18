import 'dart:html';
import 'dart:ui';
import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sand_survey/insight.dart';
import 'package:sand_survey/survey.dart';

import 'package:http/http.dart' as http;

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  Future getData() async {
    Uri url = Uri.parse("http://localhost/phpsandbox/surveyApp/FetchData.php");
    http.Response res = await http.get(url);

    var data = json.decode(res.body);
    // var dataModel = [];

    // dataModel.add("value");
    // for (var word in data['result']) {
    //   String id = word['id'];
    //   String name = word['name'];
    //   String pass = word['pass'];

    //   dataModel.add(new Model( id, name, pass));
    // }
    //amount of data
    // print("OUR FULL LENGTH " + data['result'].length.toString());
    return null;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 20,
        ),
        title: Text("Dashboard",
            style: TextStyle(
              fontSize: 14,
            )),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 20,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.44,
        width: MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        color: Colors.white70,
        child: Column(
          //working on the main thing
          children: [
            Row(
              //this is the first stuff in the
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  child: Icon(Icons.portrait_rounded, size: 30),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Column(children: [
                    Text(
                      "Data Overview",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Completed Surveys",
                      style: TextStyle(
                          fontSize: 11, color: Color.fromRGBO(0, 0, 0, 0.87)),
                    ),
                  ]),
                ),
              ],
            ),
            //totals and dates
            Row(children: [
              Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  children: [
                    Text(
                      "2",
                      style: TextStyle(
                        fontSize: 45,
                      ),
                    ),
                    Text(
                      "Last 7 Days",
                      style: TextStyle(
                        fontSize: 11,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.15,
                  top: MediaQuery.of(context).size.height * 0.03,
                ),
                child: Column(
                  children: [
                    Text(
                      "9800",
                      style: TextStyle(
                        fontSize: 35,
                      ),
                    ),
                    Text("Total", style: TextStyle(fontSize: 10))
                  ],
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.only(
                right: 110,
                top: 30,
              ),
              child: FlatButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => insight())),
                },
                child: Text("FIND OUT MORE",
                    style: TextStyle(fontSize: 11, color: Colors.purple)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => survey())),
        },
        child: Icon(Icons.add, size: 20),
      ),
    );
  }
}
