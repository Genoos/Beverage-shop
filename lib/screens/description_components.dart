import 'package:flutter/material.dart';

import 'Coffee_Tea_order_details.dart';
import 'sizer.dart';

class DetailBody extends StatelessWidget {
  final dynamic brewitem;
  final Image image;
  final GlobalKey globalkey;

  DetailBody({Key? key,this.brewitem,required this.image,required this.globalkey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: size.height * 0.3),
            padding: EdgeInsets.only(
              top: size.height * 0.12,
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(brewitem['description'].toString(),style: TextStyle(
                  fontFamily: 'IndieFlower',
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                ),),
                SizePicker(),
                CoffeeteaOrderDetails(price: brewitem['price'].toString(),image:image ,name:brewitem['name'] ,),




              ],
            ),
          ),
          Top(brewitem:brewitem,image:image,),

        ],
      ),
    );
  }
}



class Top extends StatelessWidget {
  final dynamic brewitem;
  final Image image;
  const Top( {Key? key,required this.brewitem,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${brewitem['name']}',style: Theme.of(context).textTheme.headline4!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: 'Price\n'),
                      TextSpan(
                        text: '\₹ ${brewitem['price']}',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Hero(
                    tag: '${brewitem['name']}',
                    child: SizedBox(
                        height: 200,
                        width :120,
                        child: image),
                  ),
                ))

              ],
            )
          ],
        ),
    );
  }
}

