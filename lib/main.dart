import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:provider/provider.dart';
import 'package:zeroagent/screens/details/detailspage.dart';
import 'package:zeroagent/screens/homepage/homescreen.dart';
import 'package:zeroagent/screens/onboarding/splash/splash_screen.dart';
import 'package:zeroagent/screens/onboarding/splash/welcome.dart';

import 'components/buttomnavbar.dart';
import 'components/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PropertyListProvider()),
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
    return
      GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/main', page: () => MainPage()),
        GetPage(name: '/details', page: () =>  PropertyDetailsPage(realEstateListings: null, )),
      ],
    );
  }
}

