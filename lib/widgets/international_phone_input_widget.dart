import 'package:flutter/material.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class IntlPhoneNumber extends StatefulWidget {
  const IntlPhoneNumber({super.key});

  @override
  State<IntlPhoneNumber> createState() => _IntlPhoneNumberState();
}

class _IntlPhoneNumberState extends State<IntlPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(onInputChanged: (value) {});
  }
}
