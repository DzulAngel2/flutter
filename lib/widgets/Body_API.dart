import 'package:flutter/material.dart';
import 'package:shopping_app/api_service.dart';
import 'package:shopping_app/models/bag.dart';
import 'package:shopping_app/widgets/bag_item.dart';

Widget BodyImages() {
  return FutureBuilder<List<Bag>>(
        future: ApiService().fetchBags(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No bags available'));
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return BagItem(bag: snapshot.data![index]);
              },
            );
          }
        },
      );
}
