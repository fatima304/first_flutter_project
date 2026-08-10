import 'package:first_flutter_project/features/shopping/data/product_data.dart';
import 'package:first_flutter_project/features/shopping/widgets/hot_offer_item.dart';
import 'package:first_flutter_project/features/shopping/widgets/product_card.dart';
import 'package:first_flutter_project/features/shopping/widgets/product_slider.dart';
import 'package:flutter/material.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final sliderHeight = screenWidth * 0.55;
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            const Text(
              'Our Products',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: screenWidth * 0.9,
              height: sliderHeight,
              child: const ProductSlider(),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final product = products[index];

                return ProductCard(
                  productName: product['name']!,
                  imgUrl: product['image']!,
                );
              },
            ),
            const SizedBox(height: 24),

            const Text(
              'Hot Offers',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hotOffers.length,
              itemBuilder: (context, index) {
                final offer = hotOffers[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: HotOfferItem(
                    title: offer['title']!,
                    imageUrl: offer['image']!,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
