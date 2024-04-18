import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/pagesDrawer.dart/order.dart';

class Order {
  List<String> products;
  List<int> quantities;
  double totalPrice;

  Order(this.products, this.quantities, this.totalPrice);
}

class Carrito extends StatefulWidget {
  const Carrito({Key? key}) : super(key: key);

  @override
  _CarritoState createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  int selectedIndex = -1;
  List<int> itemCounts = List.filled(4, 0);
  List<double> prices = [5.99, 4.49, 3.99, 2.99];
  List<String> plantNames = [
    "Planta de Sabila",
    "Planta de Limón",
    "Planta de Tomate",
    "Planta de Habanero"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBagImage(
                "assets/images/plant1.jpg",
                "Planta de Sabila",
                "La planta de sábila es conocida por sus propiedades medicinales y beneficios para la piel.",
                0),
            _buildBagImage("assets/images/plant2.jpg", "Planta de Limón",
                "El limón es una fruta cítrica muy versátil.", 1),
            _buildBagImage("assets/images/plant3.jpg", "Planta de Tomate",
                "Los tomates son esenciales en muchas cocinas.", 2),
            _buildBagImage("assets/images/plant4.jpg", "Planta de Habanero",
                "Los chiles habaneros son famosos por su picante intenso.", 3),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Calcular el precio total
          double totalPrice = 0;
          List<String> products = [];
          List<int> quantities = [];

          for (int i = 0; i < itemCounts.length; i++) {
            if (itemCounts[i] > 0) {
              totalPrice += itemCounts[i] * prices[i];
              products.add(plantNames[i]);
              quantities.add(itemCounts[i]);
            }
          }

          // Crear la orden
          Order order = Order(products, quantities, totalPrice);

          // Mostrar la orden en un AlertDialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Orden realizada"),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Productos:"),
                    for (int i = 0; i < order.products.length; i++)
                      Text(
                          "${order.products[i]} - Cantidad: ${order.quantities[i]}"),
                    SizedBox(height: 10),
                    Text(
                        "Precio Total: \$${order.totalPrice.toStringAsFixed(2)}"),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      guardarOrdenes(
                          ordenes); // Guardar la orden en el archivo ordens.dart
                    },
                    child: Text("Aceptar"),
                  ),
                ],
              );
            },
          );
        },
        label: Text(
          'Pagar',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          Icons.payment,
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(5, 146, 80, 1),
      ),
    );
  }

  Widget _buildBagImage(
      String imagePath, String plantName, String description, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(
            color: selectedIndex == index
                ? const Color.fromARGB(255, 0, 90, 163)
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  width: 200,
                  height: 200,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                  child: Text(
                    '\$${prices[index]}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              plantName,
              style: GoogleFonts.playfairDisplay(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (itemCounts[index] > 0) {
                          itemCounts[index]--;
                        }
                      });
                    },
                    icon: Icon(Icons.remove),
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  itemCounts[index].toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        itemCounts[index]++;
                      });
                    },
                    icon: Icon(Icons.add),
                    color: const Color.fromARGB(255, 0, 1, 2),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
