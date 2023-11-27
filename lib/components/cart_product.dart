
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:untitled/helpers/state.dart';
import 'package:untitled/models/app_state.dart';
import 'package:untitled/models/cart_product.dart';

class CartProductWidget extends StatefulWidget {
  final CartProduct cartProduct;

  const CartProductWidget({
    Key? key,
    required this.cartProduct,
  }) : super(key: key);

  @override
  _CartProductWidgetState createState() => _CartProductWidgetState();
}

class _CartProductWidgetState extends State<CartProductWidget> {
  @override
  Widget build(BuildContext context) {
    final cp = widget.cartProduct;
    final product = cp.product;
    final appState = StateUtils.appStateWithContext(context);
    return Card(
      child: ListTile(
        leading: Image.network(product.image, width: 50, height: 50),
        title: Text(product.title),
        subtitle: Text('\$ ${product.price.toStringAsFixed(2)}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                onRemove(cp, appState);
              },
            ),
            Text('${cp.quantity}'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                onAdd(cp, appState);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.red,),
              onPressed: () {
                appState.removeFromCart(cp);
              },
            ),
          ],
        ),
      ),
    );
  }
  
  onAdd(CartProduct cartProduct, AppState appState) {
    CartProduct? cp = appState.cart.firstWhereOrNull((cp) => cp.product.id == cartProduct.product.id);
    if(cp != null){
      cp.quantity++;
      appState.update();
    }
  }

  onRemove(CartProduct cartProduct, AppState appState) {
    CartProduct? cp = appState.cart.firstWhereOrNull((cp) => cp.product.id == cartProduct.product.id);
    if(cp != null){
      cp.quantity--;
      appState.update();
    }
  }
}