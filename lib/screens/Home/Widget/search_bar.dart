import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../getx/searchbar_controller.dart';
import 'searchpage_view.dart';

class MySearchBAR extends StatelessWidget {
  const MySearchBAR({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchbarController searchController =
        Get.find<SearchbarController>();
    final TextEditingController textController = TextEditingController();

    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kcontentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
            size: 30,
          ),
          const SizedBox(width: 10),
          Flexible(
            flex: 4,
            child: TextField(
              controller: textController,
              onSubmitted: (value) {
                searchController.searchProducts(value);
                Get.to(() => SearchResultsPage());
              },
              decoration: const InputDecoration(
                hintText: "Search...",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              textController.clear(); // Clear the TextField
              searchController.searchProducts(''); // Reset search results
            },
            icon: const Icon(
              Icons.clear,
              color: Colors.grey,
            ),
          ),
          Container(
            height: 25,
            width: 1.5,
            color: Colors.grey,
          ),
          IconButton(
            onPressed: () {
              // Implement filter functionality if needed
            },
            icon: const Icon(
              Icons.tune,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
