import 'package:flutter/material.dart';
import 'package:shopping_app/models/bag.dart';

class BagItem extends StatelessWidget {
  final Bag bag;

  const BagItem({required this.bag, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showOptionsDialog(context);
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                bag.imageUrl,
                fit: BoxFit.cover,
                height: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bag.name,
                    style: const TextStyle(
                      fontSize: 16,
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
          title: Text(bag.name),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Descripción:'),
              SizedBox(height: 8),
              Text(bag.descipcion),
              Text(
                '\$${bag.precio.toStringAsFixed(2)}', // Representa el precio con 2 decimales
                style: TextStyle(fontSize: 16),
              ),
            ],
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
