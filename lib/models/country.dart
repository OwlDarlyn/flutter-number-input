import 'dart:developer';

class Country {
  final String name;
  final String countryCode;
  final List phoneSuffix;
  final String flag;

  Country({
    required this.name,
    required this.countryCode,
    required this.phoneSuffix,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
      countryCode: json['idd']['root'] != '' ? json['idd']['root'] : '',
      phoneSuffix:
          json['idd']['suffixes'].length > 0 ? json['idd']['suffixes'] : [],
      // phoneSuffix:
      //     json['idd']['root'] != '' && json['idd']['suffixes'].length == 1
      //         ? json['idd']['suffixes'][0]
      //         : '',
      flag: json['flag'],
    );
  }
}
