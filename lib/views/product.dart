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
  @override
  Widget build(BuildContext context) {
    final appState = StateUtils.appStateWithContext(context);
    final product = appState.currentProduct;
    if (product == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Produto não encontrado', style: TextStyle(color: Colors.white),),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: const Center(child: Text('Produto não selecionado')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title, style: const TextStyle(color: Colors.white),),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      bottomNavigationBar:  Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: ElevatedButton(
          onPressed: () {
            addToCart(product, appState.cart, appState);
            Navigator.of(context).pushNamed('/cart');
          },
          child: const Text('Adicionar ao Carrinho'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                product.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '\$${product.price}',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                product.description,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addToCart(Product product, List<CartProduct> cart, AppState appState) {
    CartProduct? cartProduct = cart.firstWhereOrNull((cp) => cp.product.id == product.id);
    if(cartProduct != null) {
      cartProduct.quantity ++;
      appState.update();
    } else {
      appState.addToCart(CartProduct(product: product));
    }
  }
}
