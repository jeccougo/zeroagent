import 'package:flutter/cupertino.dart';
import 'package:zeroagent/screens/details/detailspage.dart';
import 'package:zeroagent/screens/homepage/homescreen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.route(): (context) => HomeScreen(),
  // MostPopularScreen.route(): (context) => const MostPopularScreen(title: '',),
  // SpecialOfferScreen.route(): (context) => const SpecialOfferScreen(),
  // ProfileScreen.route(): (context) =>  ProfileScreen(),
  PropertyDetailsPage.route(): (context) =>    PropertyDetailsPage(realEstateListings: null, ),
  // ShopDetailScreen.route(): (context) =>     ShopDetailScreen( controller: null, index: null, product: null, ),
  // CartScreen.route(): (context) =>  CartScreen(),
  // MainScreen.route: (context) => MainScreen(),

};