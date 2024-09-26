import 'package:flutter/material.dart';

class Model extends ChangeNotifier {
  bool _islast = false;
  bool get islast => _islast;

  void setislast(bool value) {
    _islast = value;
    notifyListeners();
  }

  int _count = 0;
  int get count => _count;

  void addcount() {
    _count++;
    notifyListeners();
  }

  List<Cartdata> cartdatalsit = [
  
  ];

  double _total = 0.0;
    double get total =>  _total;

    


  void addtocart(String imagepathnew, String titlenew, double pricenew) {
    cartdatalsit.add(Cartdata(imagepath: imagepathnew, title: titlenew, price: pricenew, ));
    _total = _total + pricenew;
    notifyListeners();
  }

  void removefromcart(int index) {
    cartdatalsit.removeAt(index);
    notifyListeners();
  }
}

class Cartdata {
  String imagepath;
  String title;
  double price;
  

  Cartdata(
      {required this.imagepath,
      required this.title,
      required this.price,
     });
}
