import 'package:ecommerceapp/screens/cart.dart';
import 'package:ecommerceapp/classes/categorylist.dart';
import 'package:ecommerceapp/classes/featured.dart';
import 'package:ecommerceapp/provider.dart';
import 'package:ecommerceapp/classes/recommend.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final List<String> categories = [
    'Women',
    'Suits',
    'Muslim',
    'Casual',
    'Sports'
  ];

  final List<String> imagescat = [
    'images/cat1.jpg',
    'images/cat2.jpg',
    'images/cat3.jpg',
    'images/cat4.jpg',
    'images/cat5.jpg',
  ];

  final List<String> sales = [
    'images/sale1.png',
    'images/sale2.png',
  ];

  final List<String> shirt = [
    'images/shirt1.jpg',
    'images/shirt2.jpg',
    'images/shirt1.jpg',
    'images/shirt3.jpg',
  ];

  final List recommendedItems = [
    {
      'image': 'images/item1.jpg',
      'price':  120.00,
      'description': 'Plus Size T-shirt',
    },
    {
      'image': 'images/item2.jpg',
      'price':  180.00,
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

  HomePage({super.key});

  Widget SearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for Trend Cloth...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_alt_outlined),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Image(
              image: AssetImage('images/logo2.png'),
              height: 20,
              width: 20,
            ),
            SizedBox(width: 16),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
            color: Colors.black,
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
            color: Colors.black,
          ),
           Consumer<Model>(
          builder: (context, model, child) {
            return IconButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart()));
            }, icon:  Badge.count(
              count: model.count,  
              child: const Icon(Icons.shopping_cart_outlined),
            ),)
           ;
          },
        ),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              SearchBar(),
              const SizedBox(height: 10),
              const CategoryList(),
           
              CarouselSlider(
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                ),
                items: sales.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                            image: AssetImage(item),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Featured',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
const FeaturedGrid(),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Recommend',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
                           const RecommendedList(),

            ],
          ),
        ),
      ),
    );
  }
}
