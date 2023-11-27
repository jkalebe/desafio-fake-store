import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:untitled/helpers/state.dart';
import 'package:untitled/models/cart_product.dart';
import 'package:untitled/models/product.dart';

import '../models/app_state.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final appState = StateUtils.appStateWithContext(context);
    final product = appState.currentProduct;
    if (product == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Produto não encontrado',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: const Center(child: Text('Produto não selecionado')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Quantidade"),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) quantity--;
                        });
                      },
                    ),
                    Text('$quantity'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                addToCart(product, appState.cart, appState);
                Navigator.of(context).pushNamed('/cart');
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: const Center(child: Text('Adicionar ao Carrinho'))),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              product.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addToCart(Product product, List<CartProduct> cart, AppState appState) {
    CartProduct? cartProduct =
        cart.firstWhereOrNull((cp) => cp.product.id == product.id);
    if (cartProduct != null) {
      cartProduct.quantity += quantity;
      appState.update();
    } else {
      appState.addToCart(CartProduct(product: product, quantity: quantity));
    }
  }
}
