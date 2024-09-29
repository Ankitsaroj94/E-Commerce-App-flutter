import 'package:get/get.dart';
import '../models/product_model.dart'; // Adjust the import according to your structure

class SearchbarController extends GetxController {
  var products = all.obs; // List of all products from your model
  var filteredProducts = <Product>[].obs; // List of filtered products

  @override
  void onInit() {
    super.onInit();
    filteredProducts.assignAll(products); // Initialize with all products
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(products);
    } else {
      filteredProducts.assignAll(products.where((product) =>
          product.title.toLowerCase().contains(query.toLowerCase())));
    }
  }
}
