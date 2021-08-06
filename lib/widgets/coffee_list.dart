import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeeapp/services/firebase_file.dart';
import 'package:flutter/material.dart';
import '../services/firestorage.dart';

class CoffeeList extends StatelessWidget {
  late Future<List<FirebaseFile>> futureFiles;
  late Stream<QuerySnapshot> _streambrew;
  CoffeeList(int index) {
    if (index == 1) {
      _streambrew = FirebaseFirestore.instance
          .collection('Brews/Coffees/Hot')
          .snapshots();
      futureFiles = FirebaseApi.listAll('pictures/coffees/');
    }
    else if (index == 2) {
      _streambrew = FirebaseFirestore.instance
          .collection('Brews/Cool Drinks/Cool')
          .snapshots();
      futureFiles = FirebaseApi.listAll('pictures/cooldrinks/');
    }
    else if (index == 3) {
      _streambrew = FirebaseFirestore.instance
          .collection('Brews/Milkshakes/Cool')
          .snapshots();
      futureFiles = FirebaseApi.listAll('pictures/milkshakes/');
    }
    else if (index == 4) {
      _streambrew = FirebaseFirestore.instance
          .collection('Brews/Teas/Hot')
          .snapshots();
      futureFiles = FirebaseApi.listAll('pictures/Teas/');
    }

  }



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _streambrew,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text('waiting');
                    }
        final documents = snapshot.data!.docs;

        return FutureBuilder<List<FirebaseFile>>(
            future: futureFiles,
            builder: (context,fsnapshot){
              switch (fsnapshot.connectionState){
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator(),);

                default:
                  if (fsnapshot.hasError){
                    return Center(child: Text('Some error occured!'),);
                  }
                  final files = fsnapshot.data;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start ,
                    children: [

                      const SizedBox(height: 20,),
                      Expanded(child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index){
                          return SizedBox(
                            height: 10,
                            child: Divider(
                              height: 3,color: Colors.blueGrey,
                              indent: 74,
                              endIndent: 60,
                            ),
                          );
                        },
                          itemCount: files!.length,
                          itemBuilder: (context,index){
                            final file = files[index];
                            final Image image = Image.network(
                              file.url,

                              fit: BoxFit.contain,
                            );
                            return buildFile(context, file,index,documents,image);
                          }))
                    ],
                  );
              }
            });
      }
    );

  }
  Widget buildFile(BuildContext context, FirebaseFile file,index,documents,Image image) => ListTile(
    leading:
        Image.network(
        file.url,
        width: 52,
        height: 52,
        fit: BoxFit.cover,
      ),

    title: Text(
      documents[index]['name'].toString(),
      style: TextStyle(
        fontWeight: FontWeight.bold,

        color: Colors.blue,
      ),
    ),
    subtitle: Text('Tap to view'),

    trailing:Text(
      '₹ ${documents[index]['price'].toString()}'
      ,
      style: TextStyle(
        fontSize: 20,
        color: Colors.black26,
      ),
    ) ,
    
    onTap: ()=>Navigator.of(context).pushNamed('/detailscreen',arguments: {'docid': documents,'index':index,'image':image}),




  );
}
//documents[index]['image']







// return Expanded(
//     child: StreamBuilder<QuerySnapshot>(
//         stream: _streambrew,
//         builder:
//             (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Text('waiting');
//           }
//           final documents = snapshot.data!.docs;
//           final lis = [];
//           documents.forEach((element) {
//             lis.add(element.id);
//           }); // ********
//
//           return ListView.builder(
//               itemCount: documents.length,
//               scrollDirection: Axis.vertical,
//               itemBuilder: ((BuildContext context, int index) {
//                 return Container(
//                   child: Column(
//                     children: [
//                       GestureDetector(
//                         onTap: null,
//                         child: SizedBox(
//                           height: 50,
//                           width: 50,
//                           child: Image.network(
//                             FirebaseStorage.instance
//                                 .ref()
//                                 .child(documents[index]['image'])
//                                 .getDownloadURL()
//                                 .toString(),
//                             fit: BoxFit.scaleDown,
//                           ),
//
//
//                         )
//                       )
//                     ],
//                   ),
//                 );
//               }));
//         }));





// Container(
// child: Image.network(
// FirebaseStorage.instance
//     .ref()
// .child('images/c1.png')
// .getDownloadURL()
//     .toString(),
// fit: BoxFit.scaleDown,
// ),
// );
