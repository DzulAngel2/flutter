import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/Body_API.dart';

class PlantsExt extends StatefulWidget {
  const PlantsExt({Key? key}) : super(key: key);

  @override
  State<PlantsExt> createState() => _PlantsExtState();
}

class _PlantsExtState extends State<PlantsExt> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    hintText: "Buscar",
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 14,
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Expanded(
          child: BodyImages(),
        ),
      ],
    );
  }
}
