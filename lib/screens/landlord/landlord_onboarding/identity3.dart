


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import 'identity4.dart';

class Identity3 extends StatefulWidget {
  const Identity3({Key? key}) : super(key: key);

  @override
  _Identity3State createState() => _Identity3State();
}

class _Identity3State extends State<Identity3> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Identity Verification 3 of 4'),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text(
                'Upload a proof of your Identity',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
              ),
              Text(
                'We need to verify your identity. This helps tokeep everyone safe',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
              ),

              SizedBox(height: 35,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.file_open_outlined),
                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('National Identity Number',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),),
                          Text('National Identity Number',
                            style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                            ),
                          ),),
                        ],
                      ),
                    ],
                  ),
                  Checkbox(
                    shape: StadiumBorder(),
                    value: isChecked1,
                    onChanged: (value) {
                      setState(() {
                        isChecked1 = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.file_open_outlined),
                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Drivers License',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),),
                          Text('National Identity Number',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),),
                        ],
                      ),
                    ],
                  ),
                  Checkbox(
                    shape: StadiumBorder(
                    ),
                    value: isChecked2,
                    onChanged: (value) {
                      setState(() {
                        isChecked2 = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.file_open_outlined),
                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('International Passport',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),),
                          Text('National Identity Number',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),),
                        ],
                      ),
                    ],
                  ),
                  Checkbox(
                    shape: StadiumBorder(),
                    value: isChecked3,
                    onChanged: (value) {
                      setState(() {
                        isChecked3 = value!;
                      });
                    },
                  ),
                ],
              ),

              SizedBox(height: 20),


              SizedBox(height: 24),
              Container(
                margin: EdgeInsets.only(right: 16, left: 16, bottom: 15),
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Set the border radius of the button
                    ),
                    // Set the padding of the button
                  ),
                  onPressed: () {

                    Get.to(
                            () => Identity4(),
                        duration: Duration(milliseconds: 500),
                        transition: Transition.downToUp);

                  },
                  child: Text(
                    'Done',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(right: 16, left: 16, bottom: 15),
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Set the border radius of the button
                    ),
                    // Set the padding of the button
                  ),
                  onPressed: () {
                  },
                  child: Text(
                    'skip, i will do this later',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

