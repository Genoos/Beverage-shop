import 'package:coffeeapp/providers/cartitems.dart';
import 'package:coffeeapp/screens/cartscreen.dart';
import 'package:provider/provider.dart';

import './screens/coffee_descriptionscreen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'homescreen/home_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartItems(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
          '/detailscreen' :(context) => DetailScreen(),
          '/cartscreen' : (context) => CartScreen()
        },
      ),
    );
  }
}






