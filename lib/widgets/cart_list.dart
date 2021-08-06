import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartItembuild extends StatelessWidget {
  final String name;
  final double price;
  final Image image;


  CartItembuild({Key? key, required this.name, required this.price, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: GridTile(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(9)),
                child: image,
              )
            ],
          ),
          footer: GridTileBar(
            title: Text('${name}'),
            leading: Text('${price.toString()}'),

          ),
        ),
        actions: [
          IconSlideAction(
            color: Colors.red,
            onTap: ()=>null,
            caption: 'Remove',
            icon: Icons.delete,
          )
        ]
    );
  }
}
