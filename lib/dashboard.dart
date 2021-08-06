import 'dart:html';

import 'package:flutter/material.dart';

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
                Icon(Icons.camera_alt_rounded),
                Column(children: [
                  (Text("Data Overview")),
                  Text("Completed Surveys")
                ])
              ],
            ),
            //totals and dates
            Row(children: [
              Column(
                children: [Text("2"), Text("Last & Days")],
              ),
              Column(
                children: [Text("9800"), Text("Total")],
              )
            ]),
            Text("FIND OUT MORE"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: Icon(Icons.add),
      ),
    );
  }
}
