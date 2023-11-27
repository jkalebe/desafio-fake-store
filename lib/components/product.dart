import 'package:flutter/material.dart';
import 'package:untitled/helpers/state.dart';
import 'package:untitled/models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final appState = StateUtils.appStateWithContext(context);
    return Card(
      child: ListTile(
        leading: Image.network(
          product.image,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(product.title),
        subtitle: Text('\$${product.price}'),
        onTap: () {
          appState.currentProduct = product;
          Navigator.of(context).pushNamed('/food');
        },
      ),
    );
  }
}
