import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sand_survey/insight.dart';
import 'package:sand_survey/survey.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
        title: Text("Dashboard"),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        color: Colors.white70,
        child: Column(
          //working on the main thing
          children: [
            Row(
              //this is the first stuff in the
              children: [
                Icon(Icons.person_add_alt_1_rounded),
                Column(children: [
                  (Text(
                    "Data Overview",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                  Text(
                    "Completed Surveys",
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.87)),
                  )
                ])
              ],
            ),
            //totals and dates
            Row(children: [
              Column(
                children: [
                  Text(
                    "2",
                    style: TextStyle(
                      fontSize: 96,
                    ),
                  ),
                  Text(
                    "Last 7 Days",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "9800",
                    style: TextStyle(
                      fontSize: 60,
                    ),
                  ),
                  Text("Total",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                ],
              )
            ]),

            FlatButton(
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => insight())),
              },
              child: Text("FIND OUT MORE",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple)),
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
        child: Icon(Icons.add),
      ),
    );
  }
}
