import 'package:flutter/cupertino.dart';
import 'package:untitled/models/cart_product.dart';
import 'package:untitled/models/product.dart';

import '../network/network_helper.dart';

class AppState extends ChangeNotifier {
  List<Product>? _products;
  Product? _currentProduct;
  final List<CartProduct> _cart = [];

  // Getter para produtos
  List<Product>? get products => _products;

  // Setter para produtos
  set products(List<Product>? products) {
    _products = products;
    notifyListeners();
  }

  // Getter para o produto atual
  Product? get currentProduct => _currentProduct;

  // Setter para o produto atual
  set currentProduct(Product? product) {
    _currentProduct = product;
    notifyListeners();
  }

  // Getter para o carrinho
  List<CartProduct> get cart => _cart;

  // Adicionar ao carrinho
  void addToCart(CartProduct product) {
    _cart.add(product);
    notifyListeners();
  }

  void update(){
    notifyListeners();
  }

  // Remover do carrinho
  void removeFromCart(CartProduct product) {
    _cart.remove(product);
    notifyListeners();
  }

  // Limpar o carrinho
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // Calcular o total do carrinho
  double get total {
    return _cart.fold(0.0, (total, current) => total + current.product.price);
  }

  Future<void> fetchProducts() async {
    NetworkHelper networkHelper = NetworkHelper();
    try {
      _products = await networkHelper.fetchProducts();
      notifyListeners(); // Notifica os ouvintes sobre a mudança no estado
    } catch (e) {
      print('Erro ao buscar produtos: $e');
      // Lidar com o erro conforme necessário
    }
  }

  void appInit() {
    fetchProducts();
  }
}