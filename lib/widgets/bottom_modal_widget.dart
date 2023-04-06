import 'package:flutter/material.dart';
import 'package:tbr_group_test_assignment/models/country.dart';

import '../models/app_colors.dart';
import '../api/countries_api.dart';
import 'dart:developer';

class BottomModal extends StatefulWidget {
  const BottomModal({super.key});

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  final TextEditingController searchController = TextEditingController();
  late List<Country> countries;

  @override
  void initState() {
    super.initState();
    log(fetchCountries().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultBackColor,
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: const Text(
                'Country code',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.defaultHeaderColor),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 5, top: 5),
              child: TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
                    maximumSize: MaterialStateProperty.all(const Size(22, 22)),
                    minimumSize: MaterialStateProperty.all(const Size(18, 18)),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                    backgroundColor: MaterialStateProperty.all(
                        Colors.white.withOpacity(0.4))),
                child: const Icon(
                  Icons.close,
                  size: 12,
                  color: AppColors.iconColor2,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, top: 20, left: 20),
          padding: const EdgeInsets.only(left: 10, right: 5),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextFormField(
              controller: searchController,
              textInputAction: TextInputAction.done,
              maxLines: 1,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: AppColors.iconColor2,
                ),
                hintText: 'Search',
                border: InputBorder.none,
                hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor2),
              )),
        ),
        Container(),
      ]),
    );
  }
}
