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
          size: 20,
        ),
        title: Text("Capture Household Data",
            style: TextStyle(
              fontSize: 14,
            )),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
        child: Column(
          children: [
            Text(
              "Household Survey",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                "Please capture all relevant information for each household using the fields below",
                style: TextStyle(
                    fontSize: 10, color: Color.fromRGBO(0, 0, 0, 0.87))),

            //the form capture functionality
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'First name',
                        hintStyle: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                        filled: true,
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: Colors.purple[100],
                        contentPadding: const EdgeInsets.all(8),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'First name as per identity document';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Number of persons in household',
                        hintStyle: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                        filled: true,
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: Colors.purple[100],
                        contentPadding: const EdgeInsets.all(8),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'How many people are currently living with you?';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: Row(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.05,
                            ),
                            child: Text(
                                "There are undocumented foreigners in our household",
                                style: TextStyle(
                                  fontSize: 10,
                                ))),
                        Container(
                          width: 5,
                          child: IconButton(
                              onPressed: () {}, icon: Icon(Icons.check_box)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.1,
                      bottom: MediaQuery.of(context).size.height * 0.02,
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 20),
                        ),
                        onPressed: () {
                          //validate
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Text("Submit")),
                  )
                ],
              ),
            ),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(100, 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    primary: Colors.white,
                    side: BorderSide(color: Colors.purple, width: 2)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel", style: TextStyle(color: Colors.purple)))
          ],
        ),
      ),
    );
  }
}
