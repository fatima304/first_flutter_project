import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Display both images side by side with a gap.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/product.png',
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 20),
        Image.network(
          'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSvlxJSkwOKWdsy-QINmfCPf16xLx1amycjKLk7l4BR2uPjhUpz',
          width: 150,
          height: 150,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
