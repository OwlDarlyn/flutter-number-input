import 'package:flutter/material.dart';

import '../models/app_colors.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.defaultBackColor,
        body: Column(children: [
          Container(
            alignment: Alignment.center,
            child: const Text('Lets get started'),
          ),
        ]),
      ),
    );
  }
}
