import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productName,
    required this.imgUrl,
  });

  final String productName;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(child: Image.network(imgUrl, fit: BoxFit.cover)),
            const SizedBox(height: 8),
            Text(productName, textAlign: TextAlign.center),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(l10n.itemAddedToCart)));
              },
              icon: const Icon(Icons.add_shopping_cart),
            ),
          ],
        ),
      ),
    );
  }
}
