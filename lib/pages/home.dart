import 'package:flutter/material.dart';
import 'package:shopping_app/HomeTabs/Carrito.dart';
import 'package:shopping_app/HomeTabs/PlantasExter.dart';
import 'package:shopping_app/HomeTabs/PlantasInter.dart';
import 'package:shopping_app/models/bag2.dart';
import 'package:shopping_app/widgets/Buttons_drawer.dart';
import 'package:shopping_app/widgets/Image_drawer.dart';

class Home extends StatefulWidget {
  const Home({Key? key})
      : super(key: key); // Corrección en la declaración del constructor

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    List<Bag2> bags = listOfBags();
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            drawer: Drawer(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    ImageDrawer(),
                    buttonInicio(context),
                    buttonEncontrar(context),
                    buttonVentas(context),
                    buttonInventario(context),
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(5, 146, 80, 1),
              title: const Text(
                "BIENVENIDO",
                style: TextStyle(color: Colors.white),
              ),
              bottom: const TabBar(tabs: [
                Tab(
                  child: Text(
                    "Inicio",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Lo más vendido",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    "Carrito",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ]),
            ),
            body:  TabBarView(
              children: [PlantsExt(), PlantasInter(bags2: bags ), Carrito()],
              
            )
            )
            );
  }
}
