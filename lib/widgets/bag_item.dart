import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/models/bag.dart';

class BagItem extends StatelessWidget {
  final Bag bag;
  const BagItem({required this.bag, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF1F1F1),
      child: Stack(
        children: [
          Positioned(
            right: 1,
            top: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 6, right: 9),
              child: InkWell(
                onTap: () {
                  // Navegar a otra ubicación cuando se hace clic en el ícono de "plus circle"
                  // Aquí puedes poner la lógica para navegar a donde desees
                },
                child: Icon(Icons.add_circle, size: 20), // Cambia el icono según sea necesario
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/${bag.imagePath}",
                  fit: BoxFit.contain,
                  width: 111,
                  height: 111,
                ),
                const SizedBox(height: 11),
                Text(
                  bag.name,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 18),
                GestureDetector(
                  onTap: () {
                    // Navegar a otra ubicación cuando se hace clic en "Shop now"
                    // Aquí puedes poner la lógica para navegar a donde desees
                  },
                  child: Text(
                    "Shop now",
                    style: GoogleFonts.workSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 0, 0, 0), // Color opcional para el texto
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  height: 2,
                  width: 88,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
