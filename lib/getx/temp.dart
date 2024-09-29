import 'package:get/get.dart';
import '../models/product_model.dart';

class TempCartController extends GetxController {
  final List<Product> _cart = <Product>[].obs;
  List<Product> get cart => _cart;

  void addToCart(Product product) {
    final index = _cart.indexWhere((item) => item.id == product.id);
    if (index != -1) {
      _cart[index].quantity++;
    } else {
      _cart.add(product);
    }
    update();
  }

  void removeFromCart(int index) {
    if (index >= 0 && index < _cart.length) {
      _cart.removeAt(index);
      update();
    }
  }

  void incrementQuantity(int index) {
    if (index >= 0 && index < _cart.length) {
      _cart[index].quantity++;
      update();
    }
  }

  void decrementQuantity(int index) {
    if (index >= 0 && index < _cart.length && _cart[index].quantity > 1) {
      _cart[index].quantity--;
      update();
    }
  }
}
