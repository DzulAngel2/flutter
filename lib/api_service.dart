import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopping_app/models/bag.dart';

class ApiService {
  Future<List<Bag>> fetchBags() async {
    final response = await http.get(Uri.parse('https://appvivero-4b4a35470ac8.herokuapp.com/api/Producto'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Bag.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load bags');
    }
  }
}
