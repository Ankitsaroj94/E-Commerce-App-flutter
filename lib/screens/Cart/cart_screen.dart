import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '../../getx/add_cart_getx.dart';
import 'check_out.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());

    return Scaffold(
      backgroundColor: kcontentColor,
      bottomSheet: const CheckOutBox(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Text(
                    "My Cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                final finalList = controller.cart;
                if (finalList.isEmpty) {
                  return const Center(
                    child: Text(
                      "Your cart is empty",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: finalList.length,
                  itemBuilder: (context, index) {
                    final cartItem = finalList[index];
                    return Card(
                      child: ListTile(
                        leading: Image.asset(cartItem.image),
                        title: Text(cartItem.title),
                        subtitle: Text("\$${cartItem.price} x ${cartItem.quantity}"),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            controller.removeFromCart(index);
                          },
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
