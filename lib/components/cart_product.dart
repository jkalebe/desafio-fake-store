
import 'package:flutter/material.dart';
import 'package:untitled/models/cart_product.dart';

class CartProductWidget extends StatefulWidget {
  final CartProduct cartProduct;
  // final Function onAdd;
  // final Function onRemove;

  const CartProductWidget({
    Key? key,
    required this.cartProduct,
    // required this.onAdd,
    // required this.onRemove,
  }) : super(key: key);

  @override
  _CartProductWidgetState createState() => _CartProductWidgetState();
}

class _CartProductWidgetState extends State<CartProductWidget> {
  @override
  Widget build(BuildContext context) {
    final cp = widget.cartProduct;
    final product = cp.product;
    return Card(
      child: ListTile(
        leading: Image.network(product.image, width: 50, height: 50),
        title: Text(product.title),
        subtitle: Text('R\$ ${product.price.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () => null
            ),
            Text('${cp.quantity}'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => null
            ),
          ],
        ),
      ),
    );
  }
}