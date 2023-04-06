import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/country.dart';

List<Country> parseCountry(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Country>((json) => Country.fromJson(json)).toList();
}

Future<List<Country>> fetchCountries() async {
  final response = await http.get(
      Uri.parse('https://restcountries.com/v3.1/all?fields=name,idd,flag'));
  if (response.statusCode == 200) {
    // log(response.body);
    return parseCountry(response.body);

    // return (json.decode(response.body))
    //     .map((data) => Country.fromJson(data))
    //     .toList();
  } else {
    throw Exception('Failed to fetch countries');
  }
}
