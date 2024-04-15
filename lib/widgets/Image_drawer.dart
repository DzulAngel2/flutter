import 'package:flutter/material.dart';

Widget ImageDrawer() {
  return Container(
    color: const Color.fromRGBO(5, 146, 80, 1), // Color de fondo del padding
    child: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 10.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Image.asset(
          'assets/images/Seeds_to_take_away.png',
          height: 180,
          width: 300,
        ),
      ),
    ),
  );
}
