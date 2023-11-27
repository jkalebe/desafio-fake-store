import 'package:flutter/material.dart';
import 'package:untitled/components/cart_product.dart';
import 'package:untitled/helpers/state.dart';
import 'package:untitled/models/cart_product.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {

  @override
  Widget build(BuildContext context) {
    final appState = StateUtils.appStateWithContext(context);
    List<CartProduct> products = appState.cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      bottomNavigationBar:  Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: ElevatedButton(
          onPressed: () {
          },
          child: const Text('Finalizar compra'),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return CartProductWidget(cartProduct: products[index],);
        },
      ),
    );
  }
}