import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/models/bag2.dart';

class BagItem2 extends StatelessWidget {
  final Bag2 bag2;
  final double price;

  const BagItem2({
    required this.bag2,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showOptionsDialog(context);
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/${bag2.imagePath}",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 140,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bag2.name,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(bag2.name),
          content: Text(
            '\$${price.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Acción cuando se presiona el botón "Cancelar"
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Acción cuando se presiona el botón "Agregar al carrito"
                // Aquí puedes agregar la lógica para agregar el artículo al carrito
                Navigator.of(context).pop();
              },
              child: Text('Agregar al carrito'),
            ),
          ],
        );
      },
    );
  }
}
