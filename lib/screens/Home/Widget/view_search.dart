import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../getx/searchbar_controller.dart';
import 'search_bar.dart';

class SearchPage extends StatelessWidget {
  final SearchbarController controller = Get.put(SearchbarController());

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Products"),
      ),
      body: Column(
        children: [
          const MySearchBAR(), // Use your custom search bar here
          Expanded(
            child: Obx(() {
              // Watch the filteredProducts list
              if (controller.filteredProducts.isEmpty) {
                return const Center(child: Text("No products found."));
              }
              return ListView.builder(
                itemCount: controller.filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = controller.filteredProducts[index];
                  return ListTile(
                    title: Text(product.title),
                    subtitle: Text("\$${product.price} - ${product.review}"),
                    leading: Image.asset(product.image, width: 50, height: 50),
                    onTap: () {
                      // Implement onTap functionality if needed
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
