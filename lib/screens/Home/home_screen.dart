import 'package:ecommerce_mobile_app/models/product_model.dart';
import 'package:ecommerce_mobile_app/screens/Home/Widget/product_cart.dart';
import 'package:ecommerce_mobile_app/screens/Home/Widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/category.dart';
import 'Widget/home_app_bar.dart';
import 'Widget/image_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectcategories = [
      all,
      shoes,
      beauty,
      womenFashion,
      jewelry,
      menFashion
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 35),
                // for custom appbar
                const CustomAppBar(),
                const SizedBox(height: 20),
                // for search bar
                const MySearchBAR(),
                const SizedBox(height: 20),
                // for images
                ImageSlider(
                  currentSlide: currentSlider,
                  onChange: (value) {
                    setState(
                      () {
                        currentSlider = value;
                      },
                    );
                  },
                ),
                const SizedBox(height: 20),

                // for category selection
                categoryItems(),

                const SizedBox(height: 20),
                if (selectedIndex == 0)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Special For You",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      // Text(
                      //   "See all",
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w500,
                      //     fontSize: 16,
                      //     color: Colors.black54,
                      //   ),
                      // ),
                    ],
                  ),

                // for shopping items

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: selectcategories[selectedIndex].length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: selectcategories[selectedIndex][index],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox categoryItems() {
    return SizedBox(
      height: Get.height * 0.14,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: selectedIndex == index
                    ? Colors.blue[200]
                    : Colors.transparent,
              ),
              child: Column(
                children: [
                  Container(
                    height: Get.height * 0.07,
                    width: Get.width * 0.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(categoriesList[index].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      categoriesList[index].title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
