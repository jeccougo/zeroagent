

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'landlordprofile.dart';

class LandlordLoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GoogleSignIn googleSignIn = GoogleSignIn();

  void login(BuildContext context) {
    // Perform your login logic here
    // You can use the emailController.text and passwordController.text to get the user's input

    // For simplicity, let's just print the email and password
    print('Email: ${emailController.text}');
    print('Password: ${passwordController.text}');

    // Navigate to the next screen after login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => landlordProfile()),
    );
  }

  void loginWithGoogle(BuildContext context) async {
    try {
      // Start the Google sign-in process
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        // Retrieve the Google sign-in authentication details
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        // You can use the googleAuth.idToken and googleAuth.accessToken for authentication

        // Perform your login logic here
        // ...

        // Navigate to the next screen after login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => landlordProfile()),
        );
      }
    } catch (error) {
      // Handle the error
      print('Error signing in with Google: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  Icon(
          Icons.arrow_back,
          size: 20,
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text('Are you a',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),),
              ),
              SizedBox(height: 10,),
              Text('Landlord?',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5,top: 150),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 32.0),

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
                    login(context);
                  },
                  child: Text(
                    'Login',
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

              OutlinedButton(
                onPressed: () {
                  loginWithGoogle(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/googlelogo.png', // Replace with your Google logo asset
                      height: 24.0,
                    ),
                    SizedBox(width: 8.0),
                    Text('Continue with Google'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

