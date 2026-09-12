import 'package:first_flutter_project/features/shopping/data/product_data.dart';
import 'package:first_flutter_project/features/shopping/widgets/product_card.dart';
import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final productNames = {
      'fruityMuesli': l10n.fruityMuesli,
      'quinoaFruit': l10n.quinoaFruit,
      'goldenBrownWaffle': l10n.goldenBrownWaffle,
      'cerealBowl': l10n.cerealBowl,
    };

    return GridView.builder(
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
    );
  }
}
