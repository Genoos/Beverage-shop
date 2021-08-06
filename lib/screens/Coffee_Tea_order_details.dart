import 'package:coffeeapp/providers/cartitems.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class CoffeeteaOrderDetails extends StatefulWidget {
  final String price;
  final Image image;
  final String name;

  CoffeeteaOrderDetails({required this.image,required this.name,required this.price});
  @override
  _CoffeeteaOrderDetailsState createState() => _CoffeeteaOrderDetailsState();
}

class _CoffeeteaOrderDetailsState extends State<CoffeeteaOrderDetails> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItems>(context,listen: false);
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 50,),
            Text('Number of items :' ),
            SizedBox(width: 50,),
            Row(
              children: [
                SizedBox(
                  width: 25.0,
                  height: 25.0,
                  child: OutlineButton(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    onPressed: ()=>setState(() {
                      if (numOfItems < 9) {
                        if (numOfItems > 1) {
                          setState(() {
                            numOfItems--;
                          });
                        }
                      }
                    }),
                    child: Icon(
                      Icons.remove,
                      size: 15.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    numOfItems.toString().padRight(2, 'x'),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(
                  width: 25.0,
                  height: 25.0,
                  child: OutlineButton(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0),
                    ),
                    onPressed: ()=>setState(() {
                      if (numOfItems < 9) {
                        setState(() {
                          numOfItems++;
                        });
                      }
                    }),
                    child: Icon(
                      Icons.add,
                      size: 15.0,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 20,),
        FloatingActionButton.extended(
          backgroundColor: Color(0xffffbf00),
          onPressed: () {
            // add to cart
            cart.addItems(widget.name, widget.image, widget.price);


            final snackBar = SnackBar(
                content: Text('Order placed !'),
                duration: const Duration(seconds: 2)
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Timer(Duration(seconds: 3), () {
              Navigator.of(context).pop();
            });

          },
          label: Text('Add ${widget.name} '),
          icon: Icon(Icons.add_shopping_cart),
        )
      ],
    );
  }


}

