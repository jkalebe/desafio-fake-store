import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/components/product.dart';
import 'package:untitled/models/app_state.dart';
import 'package:untitled/models/product.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fake Store',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ))
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Consumer<AppState>(
        builder: (BuildContext context, AppState appState, Widget? child) {
          List<Product>? allProduct = appState.products;
          if (allProduct != null) {
            return Container(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 5,
                  );
                },
                itemBuilder: (context, index) {
                  Product product = allProduct[index];
                  return ProductTile(product: product);
                }, itemCount: allProduct.length,
              ),
            );
          } else {
            return const Center(
              child: Text('Erro inesperado'),
            );
          }
        },
      ),
    );
  }
}
