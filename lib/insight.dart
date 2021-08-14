import 'package:flutter/material.dart';

class insight extends StatefulWidget {
  const insight({Key? key}) : super(key: key);

  @override
  _insightState createState() => _insightState();
}

class _insightState extends State<insight> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 20,
        ),
        title: Text("View Insights",
            style: TextStyle(
              fontSize: 14,
            )),
        actions: [
          Icon(
            Icons.share,
            color: Colors.white,
            size: 20,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.3,
                bottom: 5,
              ),
              child: Text(
                "Household Survey Data",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Please capture all relevant information for each household using the fields below",
              style:
                  TextStyle(fontSize: 10, color: Color.fromRGBO(0, 0, 0, 0.87)),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              child: Column(
                children: [
                  Text(
                    "4",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text("Average number of people in a household",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    child: Text(
                      "20%",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Text("of households reported having undocumented foreigners",
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
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
