import 'package:untitled/models/product.dart';

class CartProduct{
  int quantity;
  final Product product;

  CartProduct({this.quantity = 1, required this.product});
}