import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tbr_group_test_assignment/models/country.dart';

import '../api/countries_api.dart';

class Countries extends ChangeNotifier {
  List<Country> _countries = [];
  String _searchString = '';

  List<Country> get countries => _countries;
  String get searchString => _searchString;

  void getCountries() async {
    _countries = await fetchCountries();
    notifyListeners();
  }

  void searchCountries(String param) {
    _searchString = param;

    notifyListeners();
  }
}
