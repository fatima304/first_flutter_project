import 'package:first_flutter_project/features/shopping/data/product_data.dart';
import 'package:first_flutter_project/features/shopping/widgets/hot_offer_item.dart';
import 'package:first_flutter_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class HotOffersList extends StatelessWidget {
  const HotOffersList({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final offerTitles = {
      'berryWaffle': l10n.berryWaffle,
      'freshFruitBowl': l10n.freshFruitBowl,
      'berryYogurtBowl': l10n.berryYogurtBowl,
      'mixedFruitBowl': l10n.mixedFruitBowl,
    };

    return ListView.builder(
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
    );
  }
}
