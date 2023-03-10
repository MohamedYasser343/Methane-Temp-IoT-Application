import 'package:flutter/material.dart';

Widget groupNumber(IconData groupIcon, String groupNumber) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 40.0,
        ),
        Icon(
          groupIcon,
          size: 64.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          groupNumber,
          style: const TextStyle(
            fontSize: 46.0
          ),
        )
      ],
    ),
  );
}