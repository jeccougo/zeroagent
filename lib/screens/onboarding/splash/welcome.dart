import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../signup/signupscreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/bg.jpg',
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Positioned(
                bottom: 0.0,
                child: Container(
                  height: 36,
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
                'Save Time and Money: Reach\n Out to Landlords Directly',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        size: 10,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Faster Response Time',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        size: 10,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'No Agent Fees',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        size: 10,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10.0),
                      Text(
                        'Direct Communication',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                margin: EdgeInsets.only(right: 16, left: 16, bottom: 5),
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Set the border radius of the button
                    ),
                    padding:
                        EdgeInsets.all(16.0), // Set the padding of the button
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> SignupScreen()));

                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'By Getting Started you accept to Terms of Service, and you '
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
    );
  }
}

//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../homepage/homescreen.dart';
// import '../signup/signupscreen.dart';
//
// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }
//
// class _WelcomeScreenState extends State<WelcomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Stack(
//             children: [
//               Image.asset(
//                 'assets/images/bg.jpg',
//                 height: 500,
//                 width: MediaQuery.of(context).size.width,
//                 fit: BoxFit.cover,
//               ),
//               Positioned(
//                 bottom: 0.0,
//                 child: Container(
//                   height: 36,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(40),
//                       topLeft: Radius.circular(40),
//                     ),
//                     // gradient: LinearGradient(
//                     //   begin: Alignment.topCenter,
//                     //   end: Alignment.bottomCenter,
//                     //   colors: [
//                     //     Colors.transparent,
//                     //     Colors.black.withOpacity(0.9),
//                     //   ],
//                     // ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               Text(
//                 'Welcome \nto ZeroAgent',
//                 style: GoogleFonts.lato(
//                   textStyle: TextStyle(
//                     fontSize: 36.0,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               Text(
//                 'Helping you find house with no agents & hidden fees',
//                 style: GoogleFonts.lato(
//                   textStyle: TextStyle(
//                     fontSize: 14.0,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               SizedBox(height: 30.0),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15),
//                 child: Container(
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.fiber_manual_record,
//                         size: 10,
//                         color: Colors.black,
//                       ),
//                       SizedBox(width: 10.0),
//                       Text(
//                         'Access to 500+ houses with no agents or hidden fees',
//                         style: TextStyle(
//                           fontSize: 14.0,
//                           color: Colors.black,
//                           fontWeight: FontWeight.normal,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15),
//                 child: Container(
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.fiber_manual_record,
//                         size: 10,
//                         color: Colors.black,
//                       ),
//                       SizedBox(width: 10.0),
//                       Text(
//                         'Get professional feedback on house inspection with us',
//                         style: TextStyle(
//                           fontSize: 14.0,
//                           color: Colors.black,
//                           fontWeight: FontWeight.normal,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               Padding(
//                 padding: const EdgeInsets.only(left: 15),
//                 child: Container(
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.fiber_manual_record,
//                         size: 10,
//                         color: Colors.black,
//                       ),
//                       SizedBox(width: 10.0),
//                       Text(
//                         'Find your dream house, save money, and use credits to\neasily contact landlords',
//                         style: TextStyle(
//                           fontSize: 14.0,
//                           color: Colors.black,
//                           fontWeight: FontWeight.normal,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20.0),
//               Container(
//                 margin: EdgeInsets.only(right: 16, left: 16, bottom: 5),
//                 height: 60,
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue.shade900,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                           10.0), // Set the border radius of the button
//                     ),
//                     padding:
//                     EdgeInsets.all(16.0), // Set the padding of the button
//                   ),
//                   onPressed: () {
//                     Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> SignupScreen()));
//
//                   },
//                   child: Text(
//                     'Get Started',
//                     style: TextStyle(fontSize: 24),
//                   ),
//                 ),
//               ),
//               Text(
//                 'By Creating account you accept to Terms of Service, and you '
//                     'confirm\n that you have read ZeroAgent Private Policy',
//                 style: TextStyle(
//                   fontSize: 12.0,
//                   color: Colors.black,
//                   fontWeight: FontWeight.w200,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
