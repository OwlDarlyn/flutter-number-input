import 'package:flutter/material.dart';

import '../models/app_colors.dart';
import '../widgets/international_phone_input_widget.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackColor,
      body: SafeArea(
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
          Container(
            margin: const EdgeInsets.only(left: 20, right: 15),
            padding: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(16),
            ),
            child: IntlPhoneNumber(),
          ),
        ]),
      ),
    );
  }
}
