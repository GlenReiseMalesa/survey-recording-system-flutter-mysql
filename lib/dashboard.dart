import 'dart:html';
import 'dart:ui';
import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sand_survey/insight.dart';
import 'package:sand_survey/survey.dart';

import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

int nPeople = 0;
String nSurveysTaken = "";

class _dashboardState extends State<dashboard> {
  Future getData() async {
    Uri url = Uri.parse("http://localhost/phpsandbox/surveyApp/FetchData.php");
    http.Response res = await http.get(url);

    var data = json.decode(res.body);

    int nHouseHoldsWithForeigners = 0;
    nPeople = 0;

    int nP = 0;

    for (var word in data['result']) {
      String strName = word['name'];
      String strIsForeigner = word['foreigner'];
      String strPerson = word['person'];

      //the total number of people in all residences
      nP += int.parse(strPerson);
    }

    setState(() {
      nPeople = nP;
    });
    return null;
  }

  Future getLast7DaysData() async {
    Uri url = Uri.parse(
        "http://localhost/phpsandbox/surveyApp/FetchLast7DaysData.php");
    http.Response res = await http.get(url);

    var data = json.decode(res.body);
    nSurveysTaken = "";

    setState(() {
      nSurveysTaken = data['result'].length.toString();
    });

    return null;
  }

  @override
  void initState() {
    super.initState();
    getData();

    getLast7DaysData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 6.h,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 25.0.sp,
        ),
        title: Text("Dashboard",
            style: TextStyle(
              fontSize: 15.0.sp,
            )),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 25.0.sp,
          )
        ],
      ),
      body: Container(
        height: 60.0.h,
        width: 90.0.w,
        margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h, bottom: 5.h),
        color: Colors.white70,
        child: Column(
          //working on the main thing
          children: [
            Row(
              //this is the first stuff in the
              children: [
                Container(
                  margin: EdgeInsets.all(5.sp),
                  child: Icon(Icons.portrait_rounded, size: 25.0.sp),
                ),
                Container(
                  margin: EdgeInsets.all(10.sp),
                  child: Column(children: [
                    Text(
                      "Data Overview",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Completed Surveys",
                      style: TextStyle(
                          fontSize: 11.sp,
                          color: Color.fromRGBO(0, 0, 0, 0.87)),
                    ),
                  ]),
                ),
              ],
            ),
            //totals and dates
            Row(children: [
              Container(
                margin: EdgeInsets.all(10.sp),
                child: Column(
                  children: [
                    Text(
                      nSurveysTaken,
                      style: TextStyle(
                        fontSize: 45.sp,
                      ),
                    ),
                    Text(
                      "Last 7 Days",
                      style: TextStyle(
                        fontSize: 11.sp,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 45.sp, top: 3.sp, right: 3.sp),
                child: Column(
                  children: [
                    Text(
                      nPeople.toString(),
                      style: TextStyle(
                        fontSize: 35.sp,
                      ),
                    ),
                    Text("Total", style: TextStyle(fontSize: 10.sp))
                  ],
                ),
              ),
            ]),
            Container(
              margin: EdgeInsets.only(
                right: 40.w,
                top: 10.h,
              ),
              child: FlatButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => insight())),
                },
                child: Text("FIND OUT MORE",
                    style: TextStyle(fontSize: 11.sp, color: Colors.purple)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () => {
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => survey()))
              .then((value) {
            getData();
            getLast7DaysData();
          })
        },
        child: Icon(Icons.add, size: 20),
      ),
    );
  }
}
