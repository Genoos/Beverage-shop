import 'package:flutter/material.dart';

class Item {
  final Image image;
  final String name;
  final String price;
  int quantity;

  Item({required this.name,required this.image,required this.price,required this.quantity});
}

class CartItems with ChangeNotifier{
  late Map<String,Item> _items = {};

  Map<String,Item> get items{
    return {..._items};
  }


  void addItems(String name,Image image, String price){
    if (_items.containsKey(name)){
      //change quantity
      _items.update(name, (value) => Item(name: value.name, image: value.image, price: value.price, quantity: value.quantity + 1));
    }
    else{
      _items.putIfAbsent(name, () => Item(name: name, image: image, price: price, quantity: 1));
    }
    notifyListeners();

  }

  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, value) {
      total += double.parse(value.price) * value.quantity;
    });
    return total;
  }

}



