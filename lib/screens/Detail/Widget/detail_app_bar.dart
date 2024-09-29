import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../getx/favourite.dart';
import '../../../models/product_model.dart';

class DetailAppBar extends StatelessWidget {
  final Product product;

  const DetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final FavoriteController controller = Get.find<FavoriteController>();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          const Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              // Implement share functionality
            },
            icon: const Icon(Icons.share_outlined),
          ),
          const SizedBox(width: 10),
          Obx(() => IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(15),
            ),
            onPressed: () {
              controller.toggleFavorite(product);
            },
            icon: Icon(
              controller.isExist(product)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.black,
              size: 25,
            ),
          )),
        ],
      ),
    );
  }
}
