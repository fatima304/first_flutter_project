import 'package:first_flutter_project/features/shopping/widgets/hot_offers_list.dart';
import 'package:first_flutter_project/features/shopping/widgets/products_grid.dart';
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
            const ProductsGrid(),
            const SizedBox(height: 24),
            Text(
              l10n.hotOffers,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const HotOffersList(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
