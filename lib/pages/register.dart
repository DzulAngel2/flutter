import 'package:flutter/material.dart';
import 'package:shopping_app/pages/login.dart';

void main() {
  runApp(RegisterForm());
}

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register Form',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(5, 146, 80, 1),
          title: Text(
            'Registro',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton( // Agrega un IconButton en la parte izquierda de la AppBar
            icon: Icon(Icons.arrow_back, color: Colors.white), // Ícono de flecha hacia atrás
            onPressed: () {
              Navigator.pop(context); // Regresa a la pantalla anterior (login)
            },
          ),
        ),
        body: RegisterFormWidget(),
        backgroundColor: Color.fromARGB(255, 213, 207, 207),
      ),
    );
  }
}

class RegisterFormWidget extends StatefulWidget {
  @override
  _RegisterFormWidgetState createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Bienvenidos',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
              // Color verde
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
            child: Text(
              "SEEDS TO TAKE A AWAY",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(5, 146, 80, 1)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Usuario',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Introduce tu usuario',
                        filled:
                            true, // Hace que el fondo del TextFormField sea de color
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Porfavor introduce uno válido';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Introduce tu correo',
                        filled:
                            true, // Hace que el fondo del TextFormField sea de color
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Porfavor introduce uno válido';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Introduce tu contraseña',
                        filled:
                            true, // Hace que el fondo del TextFormField sea de color
                        fillColor: Colors.white,
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Porfavor introduce una válida';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Registration logic can be added here
                          String username = _usernameController.text;
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          print(
                              'Username: $username\nEmail: $email\nPassword: $password');

                          // Mostrar ventana emergente de registro exitoso
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Registro exitoso'),
                                content: Text(
                                    'Su cuenta a sido creada de forma exitosa.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Login())); // Regresa al inicio de sesión
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(5, 146, 80, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
