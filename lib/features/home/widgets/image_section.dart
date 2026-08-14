import 'package:first_flutter_project/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            AppImages.goldenBrown,
            width: 150,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 20),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSvlxJSkwOKWdsy-QINmfCPf16xLx1amycjKLk7l4BR2uPjhUpz',
            width: 150,
            height: 150,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 150,
                height: 150,
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image, size: 32),
              );
            },
          ),
        ),
      ],
    );
  }
}
