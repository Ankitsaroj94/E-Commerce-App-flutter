import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product_model.dart';

class CartController extends GetxController {
  final List<Product> _cart = [];
  var totalPrice = 0.0.obs;

  List<Product> get cart => _cart;

  @override
  void onInit() {
    super.onInit();
    loadCart(); // Load cart from Shared Preferences on initialization
  }

  void addToCart(Product product) {
    final index = _cart.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      _cart[index].quantity++;
    } else {
      _cart.add(product);
    }
    _updateTotalPrice();
    saveCart(); // Save cart after modification
    update();
  }

  void removeFromCart(int index) {
    if (index >= 0 && index < _cart.length) {
      _cart.removeAt(index);
      _updateTotalPrice();
      saveCart(); // Save cart after modification
      update();
    }
  }

  void incrementQuantity(int index) {
    if (index >= 0 && index < _cart.length) {
      _cart[index].quantity++;
      _updateTotalPrice();
      saveCart(); // Save cart after modification
      update();
    }
  }

  void decrementQuantity(int index) {
    if (index >= 0 && index < _cart.length && _cart[index].quantity > 1) {
      _cart[index].quantity--;
      _updateTotalPrice();
      saveCart(); // Save cart after modification
      update();
    }
  }

  void _updateTotalPrice() {
    totalPrice.value =
        _cart.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cartItems =
        _cart.map((item) => json.encode(item.toJson())).toList();
    await prefs.setStringList('cart', cartItems);
  }

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? cartItems = prefs.getStringList('cart');
    if (cartItems != null) {
      _cart.clear();
      _cart.addAll(cartItems
          .map((item) => Product.fromJson(json.decode(item)))
          .toList());
      _updateTotalPrice(); 
      update();
    }
  }
}
