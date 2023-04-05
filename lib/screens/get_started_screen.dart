import 'package:flutter/material.dart';

import '../models/app_colors.dart';
import '../widgets/international_phone_input_widget.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.gradientColor1,
                AppColors.gradientColor2.withOpacity(0.12)
              ]),
        ),
        child: SafeArea(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 30),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Get started',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.defaultHeaderColor),
              ),
            ),
            const SizedBox(height: 160),
            Row(children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(left: 20),
                padding: const EdgeInsets.only(left: 10, right: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text('+1'),
              )),
              // SizedBox(width: 8),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 15),
                  padding: const EdgeInsets.only(left: 10, right: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: 'Your phone number',
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: AppColors.phoneNumberColor1),
                    ),
                  ),
                ),
              ),
            ]),
            // child: IntlPhoneNumber(), cant use cause need to separate code country and number in ui
          ]),
        ),
      ),
    );
  }
}
