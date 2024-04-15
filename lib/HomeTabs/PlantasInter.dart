import 'package:flutter/material.dart';
import 'package:shopping_app/models/bag2.dart';
import 'package:shopping_app/widgets/bag_item2.dart';

class PlantasInter extends StatefulWidget {
  final List<Bag2> bags2;

  const PlantasInter({Key? key, required this.bags2}) : super(key: key);

  @override
  State<PlantasInter> createState() => _PlantasInterState();
}

class _PlantasInterState extends State<PlantasInter> {
  static const double defaultPrice = 10.0; // Precio predeterminado

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.bags2.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 230,
          mainAxisSpacing: 24,
          crossAxisSpacing: 13,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return BagItem2(
              bag2: widget.bags2[index],
              price: defaultPrice); // Establecer el precio predeterminado
        },
      ),
    );
  }
}
