import 'package:first_flutter_project/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(AppImages.berryWaffle, fit: BoxFit.cover),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(AppImages.berryYogurtBowl, fit: BoxFit.cover),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(AppImages.mixedFruitBowl, fit: BoxFit.cover),
        ),
      ],
    );
  }
}
