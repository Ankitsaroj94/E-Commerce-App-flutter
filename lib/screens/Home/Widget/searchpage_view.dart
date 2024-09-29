import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../getx/searchbar_controller.dart';

class SearchResultsPage extends StatelessWidget {
  const SearchResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchbarController searchController = Get.find<SearchbarController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Results"),
      ),
      body: Obx(() {
        // Watch the filteredProducts list
        if (searchController.filteredProducts.isEmpty) {
          return const Center(child: Text("No products found."));
        }
        return ListView.builder(
          itemCount: searchController.filteredProducts.length,
          itemBuilder: (context, index) {
            final product = searchController.filteredProducts[index];
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
    );
  }
}
