import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF8EAAFB),
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
