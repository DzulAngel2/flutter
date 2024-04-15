import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Carrito extends StatefulWidget {
  const Carrito({Key? key}) : super(key: key);

  @override
  _CarritoState createState() => _CarritoState();
}

class _CarritoState extends State<Carrito> {
  int selectedIndex =
      -1; // Índice de la planta seleccionada, -1 significa que ninguna está seleccionada
  List<int> itemCounts =
      List.filled(4, 0); // Contadores para cada planta, inicializados en 0

  // Precios de cada planta
  List<double> prices = [5.99, 4.49, 3.99, 2.99];

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
          // Lógica para pagar
          // Esto es solo un marcador de posición, deberías implementar la lógica para procesar el pago
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Pago realizado"),
                content: const Text("El pago se ha procesado correctamente."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Aceptar"),
                  ),
                ],
              );
            },
          );
        },
        label: const Text(
          'Pagar',
          style: TextStyle(color: Colors.white),
        ),
        icon: const Icon(
          Icons.payment,
          color: Colors.white,
        ),
        backgroundColor: const Color.fromRGBO(5, 146, 80, 1),
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
                : Colors.transparent, // Color del borde si está seleccionado
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
                    '\$${prices[index]}', // Precio de la planta
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
                    icon: const Icon(Icons.remove),
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
                    icon: const Icon(Icons.add),
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
