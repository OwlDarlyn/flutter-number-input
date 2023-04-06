import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:tbr_group_test_assignment/models/country.dart';

import '../api/countries_api.dart';

class Countries extends ChangeNotifier {
  List<Country> _countries = [];
  String _searchString = '';

  Country _selectedCountry =
      Country(name: '', countryCode: '', phoneSuffix: [''], flag: '');

  List<Country> get countries => _countries;
  Country get selectedCountry => _selectedCountry;
  String get searchString => _searchString;

  void getUserCountry() async {
    final http.Response parseCountry =
        await http.get(Uri.parse('http://ip-api.com/json'));
    final Map responseBody = json.decode(parseCountry.body);
    _selectedCountry =
        _countries.where((country) => country.name == 'Estonia').toList()[0];
    notifyListeners();
  }

  void getCountries() async {
    _countries = await fetchCountries();
    notifyListeners();
    getUserCountry();
  }

  void searchCountries(String param) {
    _searchString = param;
    notifyListeners();
  }

  void selectCountry(Country country) {
    _selectedCountry = country;
    notifyListeners();
  }
}
