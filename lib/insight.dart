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
          Text("Household Survey Data"),
          Container(
            child: Column(
              children: [
                Text("4"),
                Text("Average number of people in a household"),
                Text("20%"),
                Text("of households reported having undocumented foreigners")
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel")),
        ],
      ),
    );
  }
}
