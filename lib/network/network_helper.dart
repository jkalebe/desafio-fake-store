import 'package:untitled/settings.dart';

import '../models/product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  static const String api_endpoint = AppSettings.base_url;

  NetworkHelper();

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(api_endpoint));
      if (response.statusCode == 200) {
        List<dynamic> productsJson = jsonDecode(response.body);
        List<Product> products = productsJson.map((json) => Product.fromJson(json)).toList();
        return products;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}