import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/country.dart';

Future<List<Country>> fetchCountries() async {
  final response = await http.get(
      Uri.parse('https://restcountries.com/v3.1/all?fields=name,idd,flag'));
  if (response.statusCode == 200) {
    return (json.decode(response.body) as List)
        .map((data) => Country.fromJson(data))
        .toList();
  } else {
    throw Exception('Failed to fetch countries');
  }
}
