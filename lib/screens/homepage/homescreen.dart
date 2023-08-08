import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:zeroagent/models/featured.dart';
import '../../components/provider.dart';

import '../../size_config.dart';
import '../details/detailspage.dart';
import '../landlord/landlord_onboarding/identity1.dart';

class HomeScreen extends StatefulWidget {
  final List<RealEstateListing> realEstateListings;
  const HomeScreen({Key? key, required this.realEstateListings})
      : super(key: key);

  static String route() => '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final savedPropertiesProvider = Provider.of<SavedPropertiesProvider>(context);
    final RealEstateListing firstListing = widget.realEstateListings[0];
    final isPropertySaved = savedPropertiesProvider.savedProperties.contains(firstListing.id);




    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.white70,
        title: Text(
          'ZeroAgent',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal! * 5,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundColor: Colors.white70,
              radius: 20,
              child: Icon(
                Icons.notifications_active_outlined,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/bg2.jpg',
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            height: 300,
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
                        top: 120,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(
                                        () => Identity1(),
                                    duration: Duration(milliseconds: 500),
                                    transition: Transition.downToUp);
                              },
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 4,
                                      offset: Offset(0, 7),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.list,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        'List property',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 4,
                                    offset: Offset(0, 7),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.search,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      'Search property',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                      ),
                    ),
                  ),
                ],
              ),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Row(
              //     children: [
              //       Expanded(child:
              //       TextField(
              //         style: GoogleFonts.poppins(
              //           textStyle: TextStyle(
              //             fontSize: SizeConfig.blockSizeHorizontal!*3,
              //             color: Colors.black,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         decoration: InputDecoration(
              //             contentPadding: EdgeInsets.symmetric(horizontal: 16),
              //
              //           suffixIcon: Container(
              //             height: 49,
              //             width: 49,
              //             padding: EdgeInsets.all(12),
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               gradient: LinearGradient(
              //                 begin: Alignment.topCenter,
              //                 end: Alignment.bottomCenter,
              //                 colors: [
              //                   Colors.blue,
              //                   Colors.lightBlue,
              //                 ],
              //               ),
              //             ),
              //             child:  Icon(
              //               Icons.search,
              //               size: 20,
              //               color: Colors.black,
              //             ),
              //           ),
              //           hintText: 'Search address or near you',
              //           border: AImputBorder,
              //           errorBorder: AImputBorder,
              //           disabledBorder: AImputBorder,
              //           focusedBorder: AImputBorder,
              //           enabledBorder: AImputBorder,
              //           hintStyle: GoogleFonts.poppins(
              //             textStyle: TextStyle(
              //               fontSize: SizeConfig.blockSizeHorizontal!*5,
              //               color: Colors.black12,
              //               fontWeight: FontWeight.normal,
              //             ),
              //           ),
              //           filled: true,
              //           fillColor: Colors.white,
              //         ),
              //       )),
              //       SizedBox(width: SizeConfig.blockSizeHorizontal!*4,),
              //
              //     ],
              //   ),
              // ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Featured',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Text(
                          'See more',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 252,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: realEstateListings.length,
                        itemBuilder: (context, index) {
                          final listing = realEstateListings[index];
                          final isPropertySaved = savedPropertiesProvider.isPropertySaved(listing.id);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(
                                        () => PropertyDetailsPage(
                                              realEstateListings: listing,
                                            ),
                                        duration: Duration(milliseconds: 500),
                                        transition: Transition.downToUp);
                                  },
                                  child: Container(
                                    width: 250,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20.0),
                                      image: DecorationImage(
                                        image: AssetImage(
                                          listing.imageUrl,
                                        ),
                                        fit: BoxFit.cover,
                                      ),

                                    ),
                                    child: Stack(
                                      children: [
                                        Align(alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: 136,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                            gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.black.withOpacity(0.6),
                                            ],
                                          ),
                                          ),
                                        ),),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(padding: EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 20,
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  IconButton(
                                                    icon: Icon(
                                                      isPropertySaved
                                                          ? Icons.favorite
                                                          : Icons.favorite_border,
                                                      color: isPropertySaved
                                                          ? Colors.red
                                                          : Colors.white,
                                                    ),
                                                    onPressed: () {
                                                      savedPropertiesProvider
                                                          .toggleSavedProperty(listing.id);
                                                    },
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(20),
                                                          color: Colors.black.withOpacity(0.24),
                                                        ),
                                                        padding: EdgeInsets.symmetric(
                                                          horizontal: 8,
                                                          vertical: 4
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Icon(
                                                              Icons.location_on_outlined,
                                                              color: Colors.white,
                                                            ),
                                                            SizedBox(
                                                              width: 4,
                                                            ),
                                                            Text('1.6 km',
                                                              style: GoogleFonts.poppins(
                                                                textStyle: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors.white,
                                                                  fontWeight: FontWeight.normal,
                                                                ),
                                                              ),),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text( listing.title,
                                                    style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                    ),),
                                                  Text( listing.location,
                                                    style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.normal,
                                                      ),
                                                    ),),
                                                ],
                                              ),
                                            ],
                                          ),),

                                        ),
                                      ],
                                    ),
                                  ),
                                ),


                                // Text(
                                //   listing.description,
                                //   style: GoogleFonts.poppins(
                                //     textStyle: TextStyle(
                                //       fontSize: 12,
                                //       color: Colors.black,
                                //       fontWeight: FontWeight.normal,
                                //     ),
                                //   ),
                                // ),
                                // Add any other desired widgets for each listing
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),


              Container(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Near you',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Text(
                          'See more',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 272,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: realEstateListings.length,
                        itemBuilder: (context, index) {
                          final listing = realEstateListings[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 250,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        listing.imageUrl,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                SizedBox(height: 8.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      listing.price.toString(),
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.save_alt_outlined),
                                  ],
                                ),
                                // Text(
                                //   listing.description,
                                //   style: GoogleFonts.poppins(
                                //     textStyle: TextStyle(
                                //       fontSize: 12,
                                //       color: Colors.black,
                                //       fontWeight: FontWeight.normal,
                                //     ),
                                //   ),
                                // ),
                                Text(listing.location),
                                // Add any other desired widgets for each listing
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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
