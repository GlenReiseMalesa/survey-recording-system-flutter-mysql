import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';

class survey extends StatefulWidget {
  const survey({Key? key}) : super(key: key);

  @override
  _surveyState createState() => _surveyState();
}

class _surveyState extends State<survey> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// Getting value from TextField widget.
  final nameController = TextEditingController();
  final personController = TextEditingController();

  var hasforeignresident = "false";

  void SaveData(var name, var isforeign, var npersons) async {
    Uri url = Uri.parse('http://localhost/phpsandbox/surveyApp/Insert.php');

    var data = {
      "names": name,
      "foreigners": isforeign,
      "persons": npersons,
      "order_date": DateTime.now().toString()
    };
    var res = await http.post(url, body: data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 6.h,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 25.sp,
        ),
        title: Text("Capture Household Data",
            style: TextStyle(
              fontSize: 15.sp,
            )),
      ),
      body: Container(
        width: 80.w,
        margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 5.h),
        child: Column(
          children: [
            Text(
              "Household Survey",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                "Please capture all relevant information for each household using the fields below",
                style: TextStyle(
                    fontSize: 10.sp, color: Color.fromRGBO(0, 0, 0, 0.87))),

            //the form capture functionality
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: 100.w,
                    margin: EdgeInsets.only(
                      top: 2.h,
                    ),
                    child: TextFormField(
                      controller: nameController,
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
                    width: 100.w,
                    margin: EdgeInsets.only(
                      top: 2.h,
                    ),
                    child: TextFormField(
                      controller: personController,
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
                    width: 100.w,
                    child: Column(
                      children: [
                        Container(
                            width: 70.w,
                            margin: EdgeInsets.only(
                              top: 2.h,
                            ),
                            child: Text(
                                "There are undocumented foreigners in our household",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ))),
                        Container(
                          margin: EdgeInsets.only(
                            left: 3.h,
                          ),
                          child: IconButton(
                              onPressed: () {
                                if (hasforeignresident == "false") {
                                  hasforeignresident = "true";
                                } else {
                                  hasforeignresident = "false";
                                }
                              },
                              icon: Icon(
                                Icons.check_box,
                                size: 15.sp,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 5.h,
                      bottom: 2.h,
                    ),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(100, 20),
                        ),
                        onPressed: () {
                          //validate
                          if (_formKey.currentState!.validate()) {
                            var name = nameController.text;
                            var nPersons = personController.text;
                            SaveData(name, hasforeignresident, nPersons);

                            Navigator.pop(context);
                          }
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
