import 'package:flutter/cupertino.dart';

import '../screens/landlord/landlord_onboarding/landlorddashboard.dart';

class PropertyListProvider extends ChangeNotifier {
  List<Property> properties = [];

  void addProperty(Property property) {
    properties.add(property);
    notifyListeners();
  }

  void deleteProperty(Property property) {
    properties.remove(property);
    notifyListeners();
  }

  void updateProperty(Property updatedProperty) {
    final index = properties.indexWhere((property) => property.id == updatedProperty.id);
    if (index != -1) {
      properties[index] = updatedProperty;
      notifyListeners();
    }
  }

}

class SavedPropertiesProvider with ChangeNotifier {
  List<String> savedProperties = [];

  // Method to toggle the saved status of a property
  void toggleSavedProperty(String propertyId) {
    if (savedProperties.contains(propertyId)) {
      savedProperties.remove(propertyId);
    } else {
      savedProperties.add(propertyId);
    }
    notifyListeners();
  }

  // Method to check if a property is saved or not
  bool isPropertySaved(String propertyId) {
    return savedProperties.contains(propertyId);
  }
}


class NearYouListingsProvider extends ChangeNotifier {
  final Set<int> _savedProperties = {}; // Store the saved property IDs

  Set<int> get savedProperties => _savedProperties;

  bool isPropertySaved(int propertyId) {
    return _savedProperties.contains(propertyId);
  }

  void toggleSavedProperty(int propertyId) {
    if (_savedProperties.contains(propertyId)) {
      _savedProperties.remove(propertyId);
    } else {
      _savedProperties.add(propertyId);
    }
    notifyListeners();
  }
}
