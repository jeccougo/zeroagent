// import 'package:flutter/material.dart';
// import '../models/properties.dart';
//
// class SearchBar extends SearchDelegate<String> {
//   final List<RealEstateListing> searchResults;
//
//   SearchBar(this.searchResults);
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     final matchingListings = searchResults
//         .where((listing) => listing.title.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//
//     return SizedBox(
//       height: 900,
//       child: ListView.builder(
//         itemCount: matchingListings.length,
//         itemBuilder: (context, index) {
//           final item = matchingListings[index];
//           return ListTile(
//             title: Text(
//               item.title,
//               style: TextStyle(color: Colors.red),
//             ),
//             subtitle: Text(item.description),
//             onTap: () {
//               // Navigate to the details screen for the selected listing
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ListingDetailScreen(
//                     listing: item,
//                     index: index,
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final suggestions = searchResults
//         .where((listing) => listing.title.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//
//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (context, index) {
//         final item = suggestions[index];
//
//         return ListTile(
//           title: Text(item.title),
//           onTap: () {
//             // Navigate to the details screen for the selected listing
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ListingDetailScreen(
//                   listing: item,
//                   index: index,
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
