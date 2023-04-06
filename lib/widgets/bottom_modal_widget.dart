import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tbr_group_test_assignment/provider/countries_provider.dart';

import '../models/country.dart';
import '../models/app_colors.dart';
import '../api/countries_api.dart';

class BottomModal extends StatefulWidget {
  const BottomModal({super.key});

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<Countries>().getCountries();
  }

  @override
  Widget build(BuildContext context) {
    final List<Country> countries = context.watch<Countries>().countries;
    final search = context.watch<Countries>().searchString;
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
              onChanged: (value) =>
                  context.read<Countries>().searchCountries(value),
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
        Expanded(
            child: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, index) {
            if (countries[index].countryCode != '' &&
                countries[index]
                    .name
                    .toLowerCase()
                    .startsWith(search.toLowerCase())) {
              countries.sort(
                  (a, b) => a.name.toString().compareTo(b.name.toString()));

              return Container(
                margin: const EdgeInsets.only(top: 10, left: 35, right: 20),
                child: Row(children: [
                  Text(
                    countries[index].flag,
                    style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    countries[index].countryCode,
                    style: const TextStyle(
                        color: AppColors.textColor2,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    countries[index].name,
                    style: const TextStyle(
                        color: AppColors.textColor3,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  )
                ]),
              );
            } else {
              return Container();
            }
          },
        )),
      ]),
    );
  }
}
