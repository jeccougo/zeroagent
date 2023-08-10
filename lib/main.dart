











import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:zeroagent/screens/account/accountpage.dart';
import 'package:zeroagent/screens/details/detailspage.dart';
import 'package:zeroagent/screens/homepage/homescreen.dart';
import 'package:zeroagent/screens/messages/chatpage.dart';
import 'components/provider.dart';
import 'models/featured.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PropertyListProvider()),
        ChangeNotifierProvider(create: (context) => SavedPropertiesProvider()),
        Provider<List<RealEstateListing>>(create: (_) => realEstateListings),
        ChangeNotifierProvider(create: (_) => NearYouListingsProvider()),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen(realEstateListings: realEstateListings,)),
        GetPage(name: '/main', page: () => MainPage()),
        GetPage(name: '/details', page: () =>  PropertyDetailsPage(realEstateListings: null, )),
      ],
    );
  }
}

class MainPage extends StatefulWidget {
  static String route() => '/main';

  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _tap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    HomeScreen(realEstateListings: realEstateListings),
    ChatPage(),
    SavedPropertiesPage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.blue.shade900,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: GNav(
            gap: 4,
            backgroundColor: Colors.blue.shade900,
            tabBackgroundColor: Colors.black26,
            color: Colors.white,
            activeColor: Colors.white,
            onTabChange: _tap,
            padding: EdgeInsets.all(5),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.chat,
                text: 'Chat',
              ),
              GButton(
                icon: Icons.save,
                text: 'Saved',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class SavedPropertiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final savedPropertiesProvider = Provider.of<SavedPropertiesProvider>(context);

    final List<RealEstateListing> savedProperties = Provider.of<List<RealEstateListing>>(context)
        .where((property) => savedPropertiesProvider.savedProperties.contains(property.id))
        .toList();


    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blue.shade900,
        elevation: 0,
        title: Text('Saved Properties',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      body:ListView.builder(
        itemCount: savedProperties.length,
        itemBuilder: (context, index) {
          final property = savedProperties[index];
          final isPropertySaved = savedPropertiesProvider.isPropertySaved(property.id);

          return ListTile(
            leading: isPropertySaved
                ? CircleAvatar(
              backgroundImage: AssetImage(property.imageUrl),
            )
                : Icon(
              Icons.favorite_border,
              color: Colors.grey,
            ),
            title: Text(
              property.title,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            subtitle: Text(
              property.location,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            onTap: () {
              // Add the code to navigate to the property details page
              // when the property is tapped
              // Example: Get.to(() => PropertyDetailsPage(realEstateListings: property));
            },
          );
        },
      ),

    );
  }
}
