import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:sizer/sizer.dart';

class insight extends StatefulWidget {
  const insight({Key? key}) : super(key: key);

  @override
  _insightState createState() => _insightState();
}

//average people
int avePeople = 0;
int percentageHouseholdsIsForeign = 0;

class _insightState extends State<insight> {
  Future getData() async {
    Uri url = Uri.parse("http://localhost/phpsandbox/surveyApp/FetchData.php");
    http.Response res = await http.get(url);
    // int avePeople = 0;
    // int percentageHouseholdsIsForeign = 0;
    int nPeople = 0;
    int nHouseHoldsWithForeigners = 0;
    var data = json.decode(res.body);

    for (var word in data['result']) {
      String strName = word['name'];
      String strIsForeigner = word['foreigner'];
      String strPerson = word['person'];

      if (strIsForeigner == "true") {
        nHouseHoldsWithForeigners += 1;
      }
      //the total number of people in all residences
      nPeople += int.parse(strPerson);
    }

    setState(() {
      avePeople = (nPeople / data['result'].length).toInt();

      percentageHouseholdsIsForeign =
          ((nHouseHoldsWithForeigners / data['result'].length) * 100).toInt();
    });

    //amount of data
    print("TOTAL " + nPeople.toString());
    print("PERCENTAGE " + percentageHouseholdsIsForeign.toString());
    print("AVERAGE " + avePeople.toString());
    print("OUR FULL LENGTH " + data['result'].length.toString());

    return null;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 6.h,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 25.sp,
        ),
        title: Text("View Insights",
            style: TextStyle(
              fontSize: 15.sp,
            )),
        actions: [
          Icon(
            Icons.share,
            color: Colors.white,
            size: 25.sp,
          )
        ],
      ),
      body: Container(
        height: 90.h,
        width: 90.w,
        margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                right: 3.h,
                bottom: 5,
              ),
              child: Text(
                "Household Survey Data",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Please capture all relevant information for each household using the fields below",
              style: TextStyle(
                  fontSize: 10.sp, color: Color.fromRGBO(0, 0, 0, 0.87)),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              child: Column(
                children: [
                  new Text(
                    avePeople.toString(),
                    style: TextStyle(
                      fontSize: 30.sp,
                    ),
                  ),
                  Text("Average number of people in a household",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.bold)),
                  Container(
                    margin: EdgeInsets.only(top: 5.h),
                    child: Text(
                      percentageHouseholdsIsForeign.toString() + "%",
                      style: TextStyle(
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                  Text("of households reported having undocumented foreigners",
                      style: TextStyle(
                          fontSize: 10.sp, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5.h),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(100, 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      primary: Colors.white,
                      side: BorderSide(color: Colors.purple, width: 2)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(fontSize: 11, color: Colors.purple),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
