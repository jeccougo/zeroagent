import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:zeroagent/screens/onboarding/signup/signupwithemail.dart';

import '../../../components/buttomnavbar.dart';
import '../../../main.dart';
import '../../homepage/homescreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/bg2.jpg',
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                      // gradient: LinearGradient(
                      //   begin: Alignment.topCenter,
                      //   end: Alignment.bottomCenter,
                      //   colors: [
                      //     Colors.transparent,
                      //     Colors.black.withOpacity(0.9),
                      //   ],
                      // ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'ZeroAgent',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Phone Number',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> SignupEScreen()));

                        },
                        child: Text(
                          'Use Email instead',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),


                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5),
                  child: IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                    onCountryChanged: (country) {
                      print('Country changed to: ' + country.name);
                    },
                  ),
                ),
                
               
                SizedBox(height: 20.0),
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
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> MainPage()));

                    },
                    child: Text(
                      'Sign Up',
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

                Divider(
                  thickness: 2,
                  indent: 50,
                  endIndent: 50,
                ),
                SizedBox(height: 15.0),
                Container(
                  margin: EdgeInsets.only(right: 16, left: 16, bottom: 5),
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0),
                        side: BorderSide(width: 1, color: Colors.black12),// Set the border radius of the button
                      ),
                      padding:
                      EdgeInsets.all(16.0), // Set the padding of the button
                    ),
                    onPressed: () {
                    },
                    child: Text(
                      'Sign in with google',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  margin: EdgeInsets.only(right: 16, left: 16, bottom: 5),
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10.0),
                        side: BorderSide(width: 1, color: Colors.black12),// Set the border radius of the button
                      ),
                      padding:
                      EdgeInsets.all(16.0), // Set the padding of the button
                    ),
                    onPressed: () {
                    },
                    child: Text(
                      'Sign in with Facebook',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'By Creating account you accept to Terms of Service, and you '
                      'confirm\n that you have read ZeroAgent Private Policy',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
