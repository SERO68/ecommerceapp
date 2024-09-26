import 'package:ecommerceapp/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<Model>(
          builder: (context, model, child) {

        
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Deliver to Ahmed',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Cairo St. 10 Chennai'),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change',
                          style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ),
          
              const SizedBox(height: 10),
          
           
              const SizedBox(height: 10),
          
              Expanded(
                child: ListView.builder(
                  itemCount: model.cartdatalsit.length,
                  itemBuilder: (context, index) {
                    return CartItem(
                      imagepath: model.cartdatalsit[index].imagepath,
                      title: model.cartdatalsit[index].title,
                      price: model.cartdatalsit[index].price,
                      index: index,
                    );
                  },
                ),
              ),
          
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Amount Payable',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.right,
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      model.total.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {            Navigator.pop(context);
},
                    child: const Text(
                      'Checkout',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          );
          
  }),
        
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  final String imagepath;
  final String title;
  final double price;
  final String? oldPrice;
  final int index;

  CartItem({
    required this.imagepath,
    required this.title,
    required this.price,
    this.oldPrice, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagepath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
              
                Row(
                  children: [
                    Text(
                      '$price Egp',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (oldPrice != null) ...[
                      const SizedBox(width: 10),
                      Text(
                        oldPrice!,
                        style: const TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Consumer<Model>(
            builder: (context, model, child) =>
             IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {model.removefromcart(index);},
            ),
          ),
       
        ],
      ),
    );
  }
}
