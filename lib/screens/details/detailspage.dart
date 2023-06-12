import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:zeroagent/size_config.dart';
import '../../models/properties.dart';

class PropertyDetailsPage extends StatefulWidget {
  final RealEstateListing? realEstateListings;
  static String route() => '/details';

  PropertyDetailsPage({required this.realEstateListings});

  @override
  _PropertyDetailsPageState createState() => _PropertyDetailsPageState();
}

class _PropertyDetailsPageState extends State<PropertyDetailsPage> {
  bool isPropertyLiked = false;
  bool isPropertySaved = false;

  void toggleLikeProperty() {
    setState(() {
      isPropertyLiked = !isPropertyLiked;
    });
  }

  void toggleSaveProperty() {
    setState(() {
      isPropertySaved = !isPropertySaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 17),
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          margin: EdgeInsets.symmetric(horizontal: 28),

          child: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: SizeConfig.blockSizeHorizontal! * 4,
                          height: SizeConfig.blockSizeHorizontal! * 9,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mr David Mbonu',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockSizeHorizontal! * 0.5),
                            Text(
                              'Live in Landlord',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 43,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.blue,
                            Colors.lightBlue,
                          ],
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Center(
                        child: Text('Chat Now'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.realEstateListings!.title,
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 319,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0,
                        offset: Offset(0, 18),
                        blurRadius: 18,
                        color: Colors.black.withOpacity(0.1)),
                  ],
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        widget.realEstateListings!.imageUrl,
                      ))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    '\$${widget.realEstateListings!.price}',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 13),

                Text(
                  'Description:',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                ReadMoreText(
                  widget.realEstateListings!.description,
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  delimiter: '...',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),


                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      'Gallery',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),
                  ],
                ),
                SizedBox(height: 16),

                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blueAccent,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              widget.realEstateListings!.imageUrl,
                            )),

                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: index == 4-1 ? Colors.black.withOpacity(0.3) : null,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: index == 4-1 ? Text(
                            '+5',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                          ) : null
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Text(
                      'Location',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  height: 161,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          widget.realEstateListings!.imageUrl,
                        )),
                  ),
                ),
                // Row(
                //   children: [
                //     IconButton(
                //       icon: Icon(
                //         isPropertyLiked
                //             ? Icons.favorite
                //             : Icons.favorite_border,
                //         color: Colors.red,
                //       ),
                //       onPressed: toggleLikeProperty,
                //     ),
                //     SizedBox(width: 16),
                //     IconButton(
                //       icon: Icon(
                //         isPropertySaved
                //             ? Icons.bookmark
                //             : Icons.bookmark_border,
                //         color: Colors.blue,
                //       ),
                //       onPressed: toggleSaveProperty,
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
