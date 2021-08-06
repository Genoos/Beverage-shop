import 'package:coffeeapp/widgets/cart_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/cartitems.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartItems>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('On Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',style: TextStyle(fontSize: 20),),
                  SizedBox(width: 10,),
                  Spacer(),
                  Chip(
                      label: Text('${cart.totalAmount}',),
                      backgroundColor: Colors.amber,
                  ),
                  TextButton(onPressed: ()=> null,
                      child: Text('Order'),
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(Colors.green)
                      ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.all(8),
                  itemCount: cart.items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 3/2,crossAxisSpacing: 8,mainAxisSpacing: 8),
                  itemBuilder: (context,index){
                    return
                      CartItembuild(
                        name: cart.items[index]!.name,
                        image: cart.items[index]!.image,
                        price: double.parse(cart.items[index]!.price),
                        );
                  }
              ),


          )

        ],
      ),
    );
  }
}
