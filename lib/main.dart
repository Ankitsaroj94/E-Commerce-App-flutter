import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'getx/add_cart_getx.dart';
import 'getx/cartcontroller.dart';
import 'getx/favourite.dart';
import 'getx/searchbar_controller.dart';
import 'screens/nav_bar_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    Get.put(FavoriteController());
      Get.put(SearchbarController());
      Get.put(CartpageController());


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(),
      ),
      home: const BottomNavBar(),
    );
  }
}
