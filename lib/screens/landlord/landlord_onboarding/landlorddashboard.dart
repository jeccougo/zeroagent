import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import '../../../components/provider.dart';

class Property {
  final String id;
  String title;
  String description;
  double price;
  List<File> images;

  Property({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
  });
}

class DashboardPage extends StatefulWidget {
  final List<Property> properties;
  const DashboardPage({Key? key, required this.properties}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Property> properties = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        elevation: 0,
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Dashboard',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.message,
              color: Colors.white,
            ),
            onPressed: () {
              // Navigate to messaging screen
            },
          ),
        ],
      ),
      body: Consumer<PropertyListProvider>(
        builder: (context, propertyProvider, _) {
          final properties = propertyProvider.properties;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Total Listing: ${properties.length}',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: properties.length,
                  itemBuilder: (context, index) {
                    final property = properties[index];
                    return Dismissible(
                      key: Key(property.id),
                      background: Container(color: Colors.red),
                      onDismissed: (direction) {
                        propertyProvider.deleteProperty(property);
                      },
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: property.images.isNotEmpty
                              ? Image.file(
                                  property.images[0],
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  width: 60,
                                  height: 60,
                                  color: Colors.grey[200],
                                  child: Icon(Icons.image,
                                      color: Colors.grey[400]),
                                ),
                        ),
                        title: Text(property.title),
                        subtitle: Text(
                            'Price: \$${property.price.toStringAsFixed(2)}'),
                        onTap: () {
                          _navigateToPropertyDetails(property);
                        },
                        onLongPress: () {
                          _showOptionsDialog(property);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        onPressed: () {
          _showAddPropertyDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToPropertyDetails(Property property) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PropertyDetailsPage(property: property),
      ),
    );
  }

  // void _navigateToPropertyDetails(Property property) async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => PropertyDetailsPage(property: property),
  //     ),
  //   );
  //
  //   if (result != null && result is Property) {
  //     final propertyProvider =
  //     Provider.of<PropertyListProvider>(context, listen: false);
  //     propertyProvider.addProperty(result);
  //   }
  // }

  void _showOptionsDialog(Property property) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit Property'),
                onTap: () {
                  Navigator.pop(context);
                  _showEditPropertyDialog(property);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete Property'),
                onTap: () {
                  Navigator.pop(context);
                  _showDeleteConfirmationDialog(property);
                },
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Message Clients'),
                onTap: () {
                  Navigator.pop(context);
                  _navigateToMessagingPage(property);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAddPropertyDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String title = '';
        String description = '';
        double price = 0.0;
        List<File> images = [];

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            void _pickImage() async {
              final picker = ImagePicker();
              final pickedImage =
                  await picker.getImage(source: ImageSource.gallery);
              if (pickedImage != null) {
                setState(() {
                  images.add(File(pickedImage.path));
                });
              }
            }

            void _removeImage(int index) {
              setState(() {
                images.removeAt(index);
              });
            }

            return AlertDialog(
              title: Text('Add Property'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      onChanged: (value) {
                        title = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Description'),
                      onChanged: (value) {
                        description = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Price'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        price = double.parse(value);
                      },
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Images',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        ...images.map((image) {
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.file(
                                  image,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    _removeImage(images.indexOf(image));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                        GestureDetector(
                          onTap: () {
                            _pickImage();
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    final property = Property(
                      id: DateTime.now().toString(),
                      title: title,
                      description: description,
                      price: price,
                      images: images,
                    );

                    final propertyProvider = Provider.of<PropertyListProvider>(
                        context,
                        listen: false);
                    propertyProvider.addProperty(property);

                    Navigator.pop(context);
                  },
                  child: Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showEditPropertyDialog(Property property) {
    showDialog(
      context: context,
      builder: (context) {
        String title = property.title;
        String description = property.description;
        double price = property.price;
        List<File> images = List.from(property.images);

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            void _pickImage() async {
              final picker = ImagePicker();
              final pickedImage =
                  await picker.getImage(source: ImageSource.gallery);
              if (pickedImage != null) {
                setState(() {
                  images.add(File(pickedImage.path));
                });
              }
            }

            void _removeImage(int index) {
              setState(() {
                images.removeAt(index);
              });
            }

            return AlertDialog(
              title: Text('Edit Property'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      onChanged: (value) {
                        title = value;
                      },
                      controller: TextEditingController(text: title),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Description'),
                      onChanged: (value) {
                        description = value;
                      },
                      controller: TextEditingController(text: description),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Price'),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        price = double.parse(value);
                      },
                      controller: TextEditingController(text: price.toString()),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Images',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        ...images.map((image) {
                          return Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.file(
                                  image,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: () {
                                    _removeImage(images.indexOf(image));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                        GestureDetector(
                          onTap: () {
                            _pickImage();
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    final updatedProperty = Property(
                      id: property.id,
                      title: title,
                      description: description,
                      price: price,
                      images: images,
                    );

                    final propertyProvider = Provider.of<PropertyListProvider>(
                        context,
                        listen: false);
                    propertyProvider.updateProperty(updatedProperty);

                    Navigator.pop(context);
                  },
                  child: Text('Save'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(Property property) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Property'),
          content: Text('Are you sure you want to delete this property?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  properties.remove(property);
                });
                Navigator.pop(context);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToMessagingPage(Property property) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MessagingPage(property: property),
      ),
    );
  }
}

class PropertyDetailsPage extends StatelessWidget {
  final Property property;

  const PropertyDetailsPage({Key? key, required this.property})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              property.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              property.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Price: \$${property.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),
            Text(
              'Images',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var image in property.images)
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Image.file(
                        image,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagingPage extends StatelessWidget {
  final Property property;

  const MessagingPage({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messaging'),
      ),
      body: Center(
        child: Text('Messaging with clients about ${property.title}'),
      ),
    );
  }
}
