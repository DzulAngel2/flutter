import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/models/bag.dart';
import 'package:shopping_app/pages/login.dart';
import '../widgets/bag_item.dart';
import 'package:shopping_app/pages/cart_shopp.dart';
import 'package:shopping_app/pages/register.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedOption = 'Inicio'; // Opción predeterminada
  final String menuImage = 'assets/images/Seeds_to_take_away.png';

  @override
  Widget build(BuildContext context) {
    List<Bag> bags = listOfBags();

    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        title: Text(
          selectedOption,
          style: GoogleFonts.playfairDisplay(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromRGBO(5, 146, 80, 1),
        leading: Builder(
          builder: (context) => IconButton(
            iconSize: 30,
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(Icons.menu),
          ),
        ),
        actions: [
          _buildProfileIconButton(), // Nuevo icono de perfil
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromRGBO(5, 146, 80, 1), // Fondo verde del drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(5, 146, 80, 1),
                ),
                child: Image.asset(
                  menuImage,
                  fit: BoxFit.contain,
                ),
              ),
              ListTile(
                title:
                    const Text('Ventas', style: TextStyle(color: Colors.white)),
                onTap: () {
                  updateSelectedOption('Ventas');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Movimientos',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  updateSelectedOption('Movimientos');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Solicitar inventario',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  updateSelectedOption('Solicitar inventario');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Bienvenido",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
              child: Text(
                "CARLOS VIVERO",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(5, 146, 80, 1)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar...',
                        prefixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(FeatherIcons.filter),
                    onPressed: () {
                      // Aquí puedes agregar la lógica para abrir el filtro
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    // Lógica para navegar a la pestaña 1
                  },
                  style: TextButton.styleFrom(primary: Colors.black),
                  child: Text('Exterior'),
                ),
                TextButton(
                  onPressed: () {
                    // Lógica para navegar a la pestaña 2
                  },
                  style: TextButton.styleFrom(primary: Colors.black),
                  child: Text('Interior'),
                ),
                TextButton(
                  onPressed: () {
                    // Lógica para navegar a la pestaña 3
                  },
                  style: TextButton.styleFrom(primary: Colors.black),
                  child: Text('Maceteros'),
                ),
              ],
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: bags.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 230,
                mainAxisSpacing: 24,
                crossAxisSpacing: 13,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return BagItem(bag: bags[index]);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: navigationBar(),
    );
  }

  Widget navigationBar() {
    return Container(
      height: 65,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 185, 184, 184),
        borderRadius: BorderRadius.circular(69),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.home,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.search,
              size: 30,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FeatherIcons.heart,
              size: 30,
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Images()),
                  );
                },
                icon: const Icon(
                  FeatherIcons.shoppingCart,
                  size: 30,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileIconButton() {
    return PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: Text('Iniciar sesión'),
            value: 'login',
          ),
          PopupMenuItem(
            child: Text('Registrarse'),
            value: 'register',
          ),
        ];
      },
      icon: Icon(
        FeatherIcons.user,
        size: 30,
        color: Colors.white,
      ),
      onSelected: (value) {
        if (value == 'login') {
          _handleLogin(context);
        } else if (value == 'register') {
          _handleRegister(context);
        }
      },
    );
  }

  void _handleLogin(BuildContext context) {
    // Implementa aquí la lógica para iniciar sesión
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  void _handleRegister(BuildContext context) {
    // Implementa aquí la lógica para registrarse
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterForm()),
    );
  }

  void updateSelectedOption(String option) {
    setState(() {
      selectedOption = option;
    });
  }
}

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}
