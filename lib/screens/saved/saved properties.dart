import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../components/provider.dart';
import '../../models/featured.dart';

class SavedPropertiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final savedPropertiesProvider =
    Provider.of<SavedPropertiesProvider>(context);
    final realEstateListings = Provider.of<List<RealEstateListing>>(context);

    final List<RealEstateListing> savedProperties = realEstateListings
        .where((property) =>
        savedPropertiesProvider.savedProperties.contains(property.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Properties',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
          ),),
      ),
      body: ListView.builder(
        itemCount: savedProperties.length,
        itemBuilder: (context, index) {
          final property = savedProperties[index];
          final isPropertySaved =
          savedPropertiesProvider.isPropertySaved(property.id);

          return ListTile(
            title: Text(property.title,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),),
            subtitle: Text(property.location,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),),
            leading: IconButton(
              icon: Icon(
                isPropertySaved ? Icons.favorite : Icons.favorite_border,
                color: isPropertySaved ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                savedPropertiesProvider.toggleSavedProperty(property.id);
              },
            ),
            // Add any other property details you want to display in the list
          );
        },
      ),
    );
  }
}
