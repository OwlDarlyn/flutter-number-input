import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../models/app_colors.dart';
import '../models/country.dart';
import '../widgets/bottom_modal_widget.dart';
import '../provider/countries_provider.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  bool buttonEnable = false;
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    phoneNumberController.addListener(() {
      setState(() {
        buttonEnable = phoneNumberController.text.length == 14;
      });
    });
    context.read<Countries>().getCountries();
  }

  @override
  Widget build(BuildContext context) {
    final Country selectedCountry = context.watch<Countries>().selectedCountry;
    return Scaffold(
      floatingActionButton: TextButton(
        style: ButtonStyle(
            splashFactory:
                buttonEnable ? InkSplash.splashFactory : NoSplash.splashFactory,
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(
                buttonEnable ? Colors.white : Colors.white.withOpacity(0.4)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)))),
        onPressed: () => buttonEnable ? log(selectedCountry.name) : null,
        child: Icon(
          Icons.arrow_forward,
          color: buttonEnable ? AppColors.iconColor2 : AppColors.iconColor1,
          size: 40,
        ),
      ),
      backgroundColor: AppColors.defaultBackColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.gradientColor1,
                AppColors.gradientColor2.withOpacity(0.012)
              ]),
        ),
        child: SafeArea(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 30, right: 20),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Get started',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.defaultHeaderColor),
              ),
            ),
            const SizedBox(height: 160),
            Row(children: [
              Row(mainAxisSize: MainAxisSize.min, children: [
                Container(
                    height: 50,
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextButton(
                      onPressed: () => showCupertinoModalBottomSheet(
                          context: context,
                          builder: (context) => const BottomModal()),
                      child: Text(
                        selectedCountry.flag +
                            selectedCountry.countryCode +
                            (selectedCountry.phoneSuffix.length == 1
                                ? selectedCountry.phoneSuffix[0]
                                : ''),
                        style: const TextStyle(
                            color: AppColors.textColor2,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    )),
              ]),
              const SizedBox(width: 8),
              Flexible(
                flex: 5,
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.only(right: 15),
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    style: const TextStyle(
                        color: AppColors.textColor2,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    controller: phoneNumberController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    autocorrect: false,
                    maxLines: 1,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[\()\-\0-9]')),
                      LengthLimitingTextInputFormatter(14),
                      MaskedInputFormatter("(###) ###-####")
                    ],
                    decoration: const InputDecoration(
                      hintText: '(123) 123-1234',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor1),
                    ),
                  ),
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
