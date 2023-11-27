import 'package:flutter/cupertino.dart';
import 'package:untitled/models/cart_product.dart';
import 'package:untitled/models/product.dart';

import '../network/network_helper.dart';

class AppState extends ChangeNotifier {
  List<Product>? _products;
  Product? _currentProduct;
  final List<CartProduct> _cart = [];

  List<Product>? get products => _products;

  set products(List<Product>? products) {
    _products = products;
    notifyListeners();
  }

  Product? get currentProduct => _currentProduct;

  set currentProduct(Product? product) {
    _currentProduct = product;
    notifyListeners();
  }

  List<CartProduct> get cart => _cart;

  void addToCart(CartProduct product) {
    _cart.add(product);
    notifyListeners();
  }

  void update(){
    notifyListeners();
  }

  void removeFromCart(CartProduct product) {
    _cart.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  double get cartTotal {
    return _cart.fold(0.0, (total, current) => total + (current.product.price * current.quantity));
  }

  Future<void> fetchProducts() async {
    NetworkHelper networkHelper = NetworkHelper();
    try {
      _products = await networkHelper.fetchProducts();
      notifyListeners();
    } catch (e) {
      print('Erro ao buscar produtos: $e');
    }
  }

  void appInit() {
    fetchProducts();
  }
}