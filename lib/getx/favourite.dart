import 'package:get/get.dart';
import '../models/product_model.dart';

class FavoriteController extends GetxController {
  var favorites = <Product>[].obs;

  void toggleFavorite(Product product) {
    if (isExist(product)) {
      favorites.remove(product);
    } else {
      favorites.add(product);
    }
  }

  bool isExist(Product product) {
    return favorites.contains(product);
  }

  void removeFavorite(Product product) {
    favorites.remove(product);
  }
}
