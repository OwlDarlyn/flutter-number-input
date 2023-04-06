import 'dart:developer';

class Country {
  final String name;
  final String countryCode;
  final String flag;

  Country({
    required this.name,
    required this.countryCode,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['official'],
      countryCode: json['idd']['root'] != '' ? json['idd']['suffixes'][0] : '',
      flag: json['flag'],
    );
  }
}
