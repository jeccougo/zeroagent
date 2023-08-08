class RealEstateListing {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  final int bedrooms;
  final int bathrooms;
  final double area;
  final String location;

  RealEstateListing({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.location,
  });
}




List<RealEstateListing> realEstateListings = [
  RealEstateListing(
    id: '1',
    title: 'Beautiful Villa',
    description: 'Spacious villa with stunning views. This luxurious villa features high-end finishes and a modern design. The villa offers 4 bedrooms, 3 bathrooms, and a total area of 200 square meters. Located in the heart of City X, this property is surrounded by amenities and offers convenient access to shopping centers, restaurants, and parks.',
    imageUrl: 'assets/images/bg2.jpg',
    price: 250000.0,
    bedrooms: 4,
    bathrooms: 3,
    area: 200.0,
    location: 'City X',
  ),

  RealEstateListing(
    id: '2',
    title: 'Cozy Apartment',
    description: 'Modern apartment in a prime location',
    imageUrl: 'assets/images/bg.jpg',
    price: 150000.0,
    bedrooms: 2,
    bathrooms: 1,
    area: 100.0,
    location: 'City Y',
  ),
  RealEstateListing(
    id: '3',
    title: 'Cozy Apartment',
    description: 'Modern apartment in a prime location',
    imageUrl: 'assets/images/bg2.jpg',
    price: 150000.0,
    bedrooms: 2,
    bathrooms: 1,
    area: 100.0,
    location: 'City Y',
  ),
  RealEstateListing(
    id: '4',
    title: 'Cozy Apartment',
    description: 'Modern apartment in a prime location',
    imageUrl: 'assets/images/bg.jpg',
    price: 150000.0,
    bedrooms: 2,
    bathrooms: 1,
    area: 100.0,
    location: 'City Y',
  ),
  RealEstateListing(
    id: '5',
    title: 'Cozy Apartment',
    description: 'Modern apartment in a prime location',
    imageUrl: 'assets/images/bg.jpg',
    price: 150000.0,
    bedrooms: 2,
    bathrooms: 1,
    area: 100.0,
    location: 'City Y',
  ),
  // Add more listings as needed
];
