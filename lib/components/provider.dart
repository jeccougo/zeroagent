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
