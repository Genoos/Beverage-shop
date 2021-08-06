// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Categories extends StatefulWidget {
//   @override
//   _CategoriesState createState() => _CategoriesState();
// }
//
// class _CategoriesState extends State<Categories> {
//   final Stream<QuerySnapshot> _coffestream = FirebaseFirestore.instance
//       .collection('Brews').snapshots();
//
//   int selectedIndex = 0;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 75.0,
//       child: StreamBuilder<QuerySnapshot>(
//           stream: _coffestream,
//           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Text("Loading");
//             }
//             final documents = snapshot.data!.docs;
//
//             return new ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: snapshot.data!.docs.length,
//                 separatorBuilder: (BuildContext context, int index) => const Divider(),
//                 itemBuilder: (BuildContext context, int index){
//                   return GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         selectedIndex = index;
//                       });
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             padding: const EdgeInsets.all(10.0),
//                             decoration: BoxDecoration(
//                               color:
//                               selectedIndex == index ? Colors.white : Colors.transparent,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(10.0),
//                               ),
//                             ),
//                             child: Text(
//                               documents[index].id,     ************
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 15.0,
//                                 color:
//                                 selectedIndex == index ? Colors.black : Color(0xFF27251F),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }
//
//             );
//           }
//       ),
//     );
//   }
// }