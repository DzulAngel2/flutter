import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/login_widgets.dart';


class Login extends StatefulWidget {
  const Login({Key? key})
      : super(key: key); // Corrección en la declaración del constructor

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 194, 194),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Color del borde
                    width: 10.0, // Ancho del borde
                  ),
                  borderRadius:
                      BorderRadius.circular(20.0), // Radio de borde (opcional)
                ),
                child: Image.asset(
                  'assets/images/Seeds_to_take_away.png',
                  height: 180,
                ), // Ruta de tu imagen
              ),
            ),
          
          ),
          CuerpoLogin(context),
        ],
      ),
    );
  }
}
