import 'package:flutter/material.dart';

// Page
import 'package:gallerymart_app/page/ProductDetailPage.dart';

class ProductCard extends StatelessWidget {
  final Map product;

  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  product['thumbnail'],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150.0,
                ),
              ),
              const SizedBox(height: 12.0),

              // Product Title
              Text(
                product['title'],
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6.0),

              // Price
              Text(
                '\$${product['price']}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Colors.green,
                ),
              ),

              // Row with Rating and Category badges
              const SizedBox(height: 8.0),
              Row(
                children: [
                  // Rating Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade100,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, size: 16.0, color: Colors.amber),
                        const SizedBox(width: 4.0),
                        Text(
                          product['rating'].toString(),
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10.0),

                  // Category Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Text(
                      product['category'],
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
