import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  User currentUser = User(
    id: '1',
    name: 'John Doe',
    email: 'john.doe@example.com',
    profilePictureUrl: 'https://example.com/profile.jpg', // Replace with actual URL or local path.
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blue.shade900,
        elevation: 0,
        title: Text('Profile',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(currentUser.profilePictureUrl),
                ),
                SizedBox(height: 16),
                Text(
                  'Name: ${currentUser.name}',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
                SizedBox(height: 16),
                Text(
                  'Email: ${currentUser.email}',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 32),
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Update Profile',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),),
                  onTap: () {
                    // Implement update profile functionality here
                    // For example, you can use showDialog to show a form to update profile information.
                    // For simplicity, we'll just print a message.
                    print('Update Profile Clicked');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),),
                  onTap: () {
                    // Implement logout functionality here
                    // For example, you can use showDialog to show a confirmation dialog before logging out.
                    // For simplicity, we'll just print a message.
                    print('Logout Clicked');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.security),
                  title: Text('Privacy Policy',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),),
                  onTap: () {
                    // Implement privacy policy navigation here
                    // For simplicity, we'll just print a message.
                    print('Privacy Policy Clicked');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.description),
                  title: Text('Terms and Conditions',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),),
                  onTap: () {
                    // Implement terms and conditions navigation here
                    // For simplicity, we'll just print a message.
                    print('Terms and Conditions Clicked');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),),
                  onTap: () {
                    // Implement settings navigation here
                    // For simplicity, we'll just print a message.
                    print('Settings Clicked');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  String id;
  String name;
  String email;
  String profilePictureUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePictureUrl,
  });
}
