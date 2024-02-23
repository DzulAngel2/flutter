import 'package:flutter/material.dart';
import 'package:shopping_app/pages/home.dart';
import 'package:shopping_app/pages/register.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'EncodeSans',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontFamily: 'EncodeSans'),
          headline6: TextStyle(fontSize: 36.0, fontFamily: 'EncodeSans'),
          headline2: TextStyle(fontSize: 14.0, fontFamily: 'EncodeSans'),
          bodyText1: TextStyle(fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // GlobalKey para el formulario
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 213, 207, 207),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
            const SizedBox(height: 20),
            Form(
              key: _formKey, // Asignar la clave del formulario
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: const Color.fromARGB(255, 233, 227, 227),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: _usernameController,
                      obscureText: false,
                      decoration: const InputDecoration(
                        labelText: 'Usuario',
                        hintText: 'Introduce tu usuario',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, introduce un usuario válido';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      color: const Color.fromARGB(255, 233, 227, 227),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        hintText: 'Introduce tu contraseña',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, introduce una contraseña válida';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Validar el formulario antes de navegar a la siguiente pantalla
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 46, 138, 91),
                minimumSize: Size(double.infinity, 48),
              ),
              child: const Text(
                'Iniciar sesión',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Olvidé la contraseña',
                    style: TextStyle(color: Color.fromARGB(255, 7, 7, 7)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterForm()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 46, 138, 91),
                minimumSize: Size(double.infinity, 48),
              ),
              child: const Text(
                'Registrarse',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
