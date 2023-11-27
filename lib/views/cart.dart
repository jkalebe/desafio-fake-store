import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/components/cart_product.dart';
import 'package:untitled/models/app_state.dart';
import 'package:untitled/models/cart_product.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, AppState appState, child) {
      List<CartProduct> cartProducts = appState.cart;
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Carrinho',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      '\$ ${appState.cartTotal.toStringAsFixed(2)}',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: Center(
                    child: const Text(
                      'Finalizar compra',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: cartProducts.isNotEmpty
            ? ListView.builder(
                itemCount: cartProducts.length,
                itemBuilder: (context, index) {
                  return CartProductWidget(
                    cartProduct: cartProducts[index],
                  );
                },
              )
            : Center(
                child: Text("Carrinho vazio!"),
              ),
      );
    });
  }
}
