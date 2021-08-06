// import 'package:flutter/material.dart';
// import 'catogries.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class Body extends StatelessWidget {
//   const Body({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.lime,
//       child: Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Categories(),
//             StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('Brews').snapshots(),
//                   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Text("Loading");
//                     }
//                     final documents = snapshot.data!.docs;
//                     return Expanded(
//                       child: ListView.builder(
//                           itemBuilder: itemBuilder),
//                     );
//                   },
//                 )
//
//           ],
//         ),
//       ),
//     );
//   }
// }



