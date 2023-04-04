import 'package:flutter/material.dart';

import '../models/app_colors.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackColor,
      body: SafeArea(
        child: Column(children: [
          Container(
            alignment: Alignment.center,
            child: const Text('Lets get started'),
          ),
        ]),
      ),
    );
  }
}
