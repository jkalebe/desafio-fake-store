import 'package:flutter/material.dart';
import 'package:untitled/views/cart.dart';
import 'package:untitled/views/menu_list.dart';
import 'package:untitled/views/product.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MenuWidget());
      case '/product':
        return MaterialPageRoute(builder: (_) => ProductWidget());
      case '/cart':
        return MaterialPageRoute(builder: (_) => CartWidget());

      default: return _errorRoute("Fake Store");
    }
  }

  static Route<dynamic> _errorRoute(String name) {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(name),
          ),
          body: const Center(
            child: Text('Você não devia ter chegado aqui.'),
          ),
        );
      },
    );
  }
}