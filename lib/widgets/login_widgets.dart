import 'package:flutter/material.dart';
import 'package:shopping_app/pages/home.dart';


Widget CuerpoLogin(BuildContext context) {
  return Center(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      campoUsuario(),
      campoContrasena(),
      const SizedBox(
        height: 10,
      ),
      botonEntrar(context),
      const SizedBox(
        height: 10,
      ),
      TextButton(
          onPressed: () {},
          child: const Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Olvidaste la contraseña",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          )),
      botonRegistrar(),
    ],
  ));
}

Widget campoUsuario() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: const TextField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          hintText: "Usuario",
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14)),
    ),
  );
}

Widget campoContrasena() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          hintText: "Contraseña",
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14)),
    ),
  );
}

Widget botonEntrar(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Home()));
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 46, 138, 91),
      padding: EdgeInsets.symmetric(horizontal: 50),
    ),
    child: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
      child: Text(
        "Iniciar sesión",
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    ),
  );
}

Widget botonRegistrar() {
  return ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 46, 138, 91),
      padding: EdgeInsets.symmetric(horizontal: 50),
    ),
    child: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
      child: Text(
        "Registrar",
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    ),
  );
}
