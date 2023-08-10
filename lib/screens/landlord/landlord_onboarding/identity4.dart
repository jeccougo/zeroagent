
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'landlorddashboard.dart';



class Identity4 extends StatefulWidget {
  @override
  _Identity4State createState() => _Identity4State();
}

class _Identity4State extends State<Identity4> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('Identity Verification 4 of 4'),
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    'Upload proof of residential address',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 23.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Upload a copy of your bank statement, or nepa bill to verify',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            SizedBox(height: 50,),
            Container(
              width: 350,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                  strokeAlign: StrokeAlign.center,
                ),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: _imageFile != null
                        ? Image.file(
                      _imageFile!,
                      fit: BoxFit.cover,
                    )
                        : Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Icon(
                        Icons.person_add_alt,
                        size: 40,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _pickImage(ImageSource.gallery),

                    child: Text(
                      'Choose a file or drag to upload',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text('Max 10mb'),
                ],
              ),
            ),
            // SizedBox(height: 24),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       ElevatedButton(
            //         onPressed: () => _pickImage(ImageSource.camera),
            //         child: Text('Take a Photo'),
            //       ),
            //       ElevatedButton(
            //         onPressed: () => _pickImage(ImageSource.gallery),
            //         child: Text('Choose from Gallery'),
            //       ),
            //     ],
            //   ),
            // ),


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
                          () => DashboardPage(properties: [],),
                      duration: Duration(milliseconds: 500),
                      transition: Transition.downToUp);

                },
                child: Text(
                  'Upload',
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
                  'skip',
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
    );
  }
}

