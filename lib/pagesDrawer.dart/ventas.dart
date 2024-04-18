import 'package:flutter/material.dart';

class Ventas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Ventas'),
      ),
      body: ListView.builder(
        itemCount: 4, // Número fijo de elementos para esta demostración
        itemBuilder: (context, index) {
          // Lista de imágenes y precios fijos
          final List<String> plantImages = [
            "assets/images/plant1.jpg",
            "assets/images/plant2.jpg",
            "assets/images/plant3.jpg",
            "assets/images/plant4.jpg",
          ];
          final List<double> prices = [5.99, 4.49, 3.99, 2.99];

          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.asset(
                plantImages[index],
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              title: Text('Venta ${index + 1}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Producto: Planta ${index + 1}'),
                  Text('Precio: \$${prices[index].toStringAsFixed(2)}'),
                ],
              ),
              onTap: () {
                // Aquí podrías implementar una acción al seleccionar una orden
              },
            ),
          );
        },
      ),
    );
  }
}
