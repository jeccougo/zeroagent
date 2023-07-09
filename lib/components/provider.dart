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
}