import 'package:flutter/material.dart';
import 'package:shopping_app/pages/home.dart';
import 'package:shopping_app/pages/login.dart';
import 'package:shopping_app/pagesDrawer.dart/ventas.dart';

Widget buttonInicio(BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color.fromARGB(255, 195, 215, 205),
        padding: const EdgeInsets.symmetric(horizontal: 125),
      ),
      child: const Text(
        "Inicio",
        style: TextStyle(color: Colors.black),
      ));
}

Widget buttonEncontrar(BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color.fromARGB(255, 195, 215, 205),
        padding: const EdgeInsets.symmetric(horizontal: 100),
      ),
      child: const Text(
        "Movimientos",
        style: TextStyle(color: Colors.black),
      ));
}

Widget buttonVentas(BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Ventas(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color.fromARGB(255, 195, 215, 205),
        padding: const EdgeInsets.symmetric(horizontal: 120),
      ),
      child: const Text(
        "Ventas",
        style: TextStyle(color: Colors.black),
      ));
}

Widget buttonInventario(BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Ventas()));
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color.fromARGB(255, 195, 215, 205),
        padding: const EdgeInsets.symmetric(horizontal: 110),
      ),
      child: const Text(
        "Inventario",
        style: TextStyle(color: Colors.black),
      ));
}
