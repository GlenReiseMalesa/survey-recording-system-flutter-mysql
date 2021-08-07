import 'package:flutter/material.dart';

class survey extends StatefulWidget {
  const survey({Key? key}) : super(key: key);

  @override
  _surveyState createState() => _surveyState();
}

class _surveyState extends State<survey> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
        title: Text("Capture Household Data"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Household Survey"),
            Text(
                "Please capture all relevant information for each household using the fields below"),

            //the form capture functionality
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: 'First name'),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'First name as per identity document';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Number of persons in household'),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'How many people are currently living with you?';
                      }
                      return null;
                    },
                  ),
                  Row(
                    children: [
                      Text(
                          "There are undocumented foreigners in our household"),
                      ElevatedButton(
                          onPressed: () {}, child: Icon(Icons.check_box))
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        //validate
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: Text("Submit"))
                ],
              ),
            ),

            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"))
          ],
        ),
      ),
    );
  }
}
