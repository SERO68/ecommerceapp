import 'package:ecommerceapp/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecommendedList extends StatelessWidget {
  const RecommendedList({super.key});

  final List<Map<String, dynamic>> recommendedItems = const [
    {
      'image': 'images/item1.jpg',
      'price': 120.00,
      'description': 'Plus Size T-shirt',
    },
    {
      'image': 'images/item2.jpg',
      'price': 180.00,
      'description': 'Slim Size T-shirt',
    },
    {
      'image': 'images/item3.jpg',
      'price': 180.00,
      'description': 'Slim Size T-shirt',
    },
    {
      'image': 'images/item4.jpg',
      'price': 180.00,
      'description': 'Slim Size T-shirt',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(builder: (context, model, child) {
      return SizedBox(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendedItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(recommendedItems[index]['image']!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.pink.withOpacity(0.8),
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${recommendedItems[index]['price']!} Egp',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  recommendedItems[index]['description']!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                model.addcount();
                                model.addtocart(
                                  recommendedItems[index]['image']!,
                                  recommendedItems[index]['description']!,
                                  recommendedItems[index]['price']!,
                                );
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
