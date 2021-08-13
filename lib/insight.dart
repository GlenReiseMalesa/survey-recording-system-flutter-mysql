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
          size: 30,
        ),
        title: Text("View Insights"),
        actions: [
          Icon(
            Icons.share,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
      body: Column(
        children: [
          Text(
            "Household Survey Data",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Please capture all relevant information for each household using the fields below",
            style:
                TextStyle(fontSize: 14, color: Color.fromRGBO(0, 0, 0, 0.87)),
          ),
          Container(
            child: Column(
              children: [
                Text(
                  "4",
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
                Text("Average number of people in a household",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(
                  "20%",
                  style: TextStyle(
                    fontSize: 60,
                  ),
                ),
                Text("of households reported having undocumented foreigners",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(120, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  primary: Colors.white,
                  side: BorderSide(color: Colors.purple, width: 2)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Close",
                style: TextStyle(color: Colors.purple),
              )),
        ],
      ),
    );
  }
}
