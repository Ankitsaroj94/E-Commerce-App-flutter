import 'package:get/get.dart';
import '../models/product_model.dart';

class CartpageController extends GetxController {
  final List<Product> _cart = [];
  var totalPrice = 0.0.obs;

  List<Product> get cart => _cart;

  void incrementQuantity(int index) {
    if (index < _cart.length) {
      _cart[index].quantity++;
      _updateTotalPrice();
      update();
    }
  }

  void decrementQuantity(int index) {
    if (index < _cart.length && _cart[index].quantity > 1) {
      _cart[index].quantity--;
      _updateTotalPrice();
      update();
    }
  }

  void removeFromCart(int index) {
    if (index < _cart.length) {
      _cart.removeAt(index);
      _updateTotalPrice();
      update();
    }
  }

  void _updateTotalPrice() {
    totalPrice.value = _cart.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }
}
