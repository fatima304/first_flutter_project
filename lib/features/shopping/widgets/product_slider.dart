import 'package:flutter/material.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Image.asset('assets/images/product.png', fit: BoxFit.cover),
        Image.network('https://picsum.photos/400/300', fit: BoxFit.cover),
        Image.network('https://picsum.photos/401/300', fit: BoxFit.cover),
      ],
    );
  }
}
