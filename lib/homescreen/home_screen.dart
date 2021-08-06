import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeapp/providers/cartitems.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/coffee_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {

  final Stream<QuerySnapshot> _stream =
      FirebaseFirestore.instance.collection('Brews').snapshots();

  @override
  Widget build(BuildContext context) {
    return

       StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final documents = snapshot.data!.docs;
            final lis=[];
            documents.forEach((element) {lis.add(element.id);});   // ********

            return DefaultTabController(
              length: snapshot.data!.docs.length,
              child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text(
                    'Brew Menu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.teal,
                  elevation: 0.0,
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.person),
                      iconSize: 30,
                    ),
                  ],
                  bottom: TabBar(
                    indicatorWeight: 2.0,
                    indicatorColor: Colors.deepOrangeAccent,
                    isScrollable: true,
                    tabs: [for(final tab in lis) Tab(text: tab,)],



                  ),
                ),
                drawer: Drawer(child:Column(
                  children: [
                    SizedBox(height: 30,),
                    GestureDetector(
                      child: Text('cart'),
                      onTap: ()=> Navigator.of(context).pushNamed('/cartscreen'),
                    ),
                    Text('settings')]
                    )),
                body: Container(
                  height: double.infinity,
                  width:double.infinity,
                  decoration: BoxDecoration(gradient:
                  LinearGradient(
                      colors: [
                        Colors.white10,
                        Colors.tealAccent,

                        Colors.white12
                        //add more colors for gradient
                      ],
                      begin: Alignment.topLeft, //begin of the gradient color
                      end: Alignment.bottomRight, //end of the gradient color
                      stops: [0,  0.4, 0.9] //stops for individual color
                    //set the stops number equal to numbers of color
                  )
                  ),
                  child: TabBarView(
                    children: [CoffeeList(1),CoffeeList(2),CoffeeList(3),CoffeeList(4)],
                  ),
                ),
              ),
            );
          });

  }
}
