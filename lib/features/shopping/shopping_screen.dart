import 'package:first_flutter_project/features/shopping/data/product_data.dart';
import 'package:first_flutter_project/features/shopping/widgets/hot_offer_item.dart';
import 'package:first_flutter_project/features/shopping/widgets/product_card.dart';
import 'package:first_flutter_project/features/shopping/widgets/product_slider.dart';
import 'package:first_flutter_project/l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;

    final productNames = {
      'fruityMuesli': l10n.fruityMuesli,
      'quinoaFruit': l10n.quinoaFruit,
      'goldenBrownWaffle': l10n.goldenBrownWaffle,
      'cerealBowl': l10n.cerealBowl,
    };

    final offerTitles = {
      'berryWaffle': l10n.berryWaffle,
      'freshFruitBowl': l10n.freshFruitBowl,
      'berryYogurtBowl': l10n.berryYogurtBowl,
      'mixedFruitBowl': l10n.mixedFruitBowl,
    };

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(l10n.shopping),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              l10n.ourProducts,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: screenWidth,
              height: sliderHeight,
              child: const ProductSlider(),
            ),
            const SizedBox(height: 24),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  productName: productNames[product['nameKey']!]!,
                  imgUrl: product['image']!,
                );
              },
            ),
            const SizedBox(height: 24),
            Text(
              l10n.hotOffers,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hotOffers.length,
              itemBuilder: (context, index) {
                final offer = hotOffers[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: HotOfferItem(
                    title: offerTitles[offer['titleKey']!]!,
                    imageUrl: offer['image']!,
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
