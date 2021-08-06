import './description_components.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key}) : super(key: key);
  final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final index = routeArgs['index'];
    final brewitem = routeArgs['docid'][index];
    final Image image = routeArgs['image'];

    return Scaffold(
      key: globalKey,
      backgroundColor: Color(0xffb38600),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(
          '${routeArgs['docid'][index]['type']}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xffb38600),
        elevation: 0.0,
      ),
      body: DetailBody(
        globalkey: globalKey,
        brewitem: brewitem,
        image: image,
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Color(0xffffbf00),
      //   onPressed: () {
      //     final snackBar = SnackBar(
      //         content: Text('Order placed !'),
      //         duration: const Duration(seconds: 2)
      //     );
      //     globalKey.currentState!.showSnackBar(snackBar);
      //     Timer(Duration(seconds: 3), () {
      //       Navigator.of(context).pop();
      //     });
      //
      //   },
      //   label: Text('Add ${brewitem['name'].toString()} '),
      //   icon: Icon(Icons.add_shopping_cart),
      // ),
    );
  }
}
