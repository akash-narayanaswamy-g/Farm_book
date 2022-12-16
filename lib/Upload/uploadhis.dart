// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:farm_book/Upload/mycolor.dart';
// import 'package:farm_book/Upload/uploading.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'card.dart';
// import 'crud.dart';

// class MyEventPage extends StatefulWidget {
//   @override
//   _MyEventPageState createState() => _MyEventPageState();
// }

// class _MyEventPageState extends State<MyEventPage> {
//   CrudMethods crudMethods = new CrudMethods();
//   Stream<QuerySnapshot>? postsStream;
//   bool onselectTech = true;
//   bool onselectNTech = false;
//   Widget PostList() {
//     return
//         // WillPopScope(
//         // onWillPop: () {
//         //    Navigator.push(
//         //         context,
//         //         MaterialPageRoute(
//         //           builder: (context) => mainscreen(),
//         //         ),
//         //       );
//         // },
//         // child:
//         SingleChildScrollView(
//       child: postsStream != null
//           ? Column(
//               children: [
//                 Container(
//                     margin:
//                         EdgeInsets.all(MediaQuery.of(context).size.width * 0.07)
//                             .copyWith(top: 0, bottom: 0),
//                     height: MediaQuery.of(context).size.height * 0.1,
//                     width: MediaQuery.of(context).size.width,
//                     child: Row(
//                       children: [
//                         Container(
//                           height: MediaQuery.of(context).size.height * 0.07,
//                           width: MediaQuery.of(context).size.width * 0.40,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                                 onselectNTech = false;
//                                 onselectTech = true;
//                               });
//                             },
//                             style: ElevatedButton.styleFrom(
//                               elevation: onselectTech ? 50 : 0,
//                               primary: onselectTech
//                                   ? Colors.green
//                                   : Colors.grey.shade400,
//                               onPrimary: Colors.white,
//                               side: BorderSide(
//                                   color: onselectTech
//                                       ? Colors.black
//                                       : Colors.white,
//                                   width: 1),
//                             ),
//                             child: Text(
//                               "Field related",
//                               style: TextStyle(
//                                   color: onselectTech
//                                       ? Colors.black
//                                       : Colors.grey),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.05,
//                         ),
//                         Container(
//                           height: MediaQuery.of(context).size.height * 0.07,
//                           width: MediaQuery.of(context).size.width * 0.40,
//                           child: ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                                 onselectTech = false;
//                                 onselectNTech = true;
//                               });
//                             },
//                             style: ElevatedButton.styleFrom(
//                               elevation: onselectNTech ? 50 : 0,
//                               primary:
//                                   onselectNTech ? Colors.green : Colors.grey,
//                               onPrimary: Colors.white,
//                               side: BorderSide(
//                                   color: onselectNTech
//                                       ? Colors.black
//                                       : Colors.white,
//                                   width: 1),
//                             ),
//                             child: Text(
//                               "Crop related",
//                               style: TextStyle(
//                                   color: onselectNTech
//                                       ? Colors.black
//                                       : Colors.white),
//                             ),
//                           ),
//                         )
//                       ],
//                     )),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 StreamBuilder<QuerySnapshot>(
//                     stream: postsStream,
//                     builder: (BuildContext context,
//                         AsyncSnapshot<QuerySnapshot> snapshot) {
//                       if (snapshot.hasError)
//                         return Text('Error = ${snapshot.error}');
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Center(
//                           child: CircularProgressIndicator(
//                               valueColor: new AlwaysStoppedAnimation<Color>(
//                                   Colors.cyan)),
//                         );
//                       }
//                       final document = snapshot.data!.docs;
//                       return ListView.builder(
//                           physics: NeverScrollableScrollPhysics(),
//                           padding: EdgeInsets.symmetric(horizontal: 16),
//                           itemCount: document.length,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             Map<String, dynamic> data =
//                                 document[index].data()! as Map<String, dynamic>;
//                             print("tag ${data['tag']}");
//                             DateTime parseDate = new DateFormat("dd-MM-yyyy")
//                                 .parse(data['date']);
//                             DateTime currentDate =
//                                 DateTime.now().subtract(Duration(hours: 24));
//                             print(parseDate.compareTo(currentDate) > 0);
//                             if (data['tag'] == "Field Related" &&
//                                 onselectTech == true &&
//                                 parseDate.compareTo(currentDate) > 0) {
//                               return MyCard(
//                                 index: data['index'],
//                                 imageUrl: data['imgUrl'],
//                                 title: data['title'],
//                                 description: data['desc'],
//                                 date: data['date'],
//                                 regUrl: data['regUrl'],
//                                 tag: data['tag'],
//                                 host: data['host'],
//                                 eventresult: data['eventresult'],
//                                 gallery: data['gallery'],
//                               );
//                             }
//                             if (data['tag'] == "Crop Related" &&
//                                 onselectNTech == true &&
//                                 parseDate.compareTo(currentDate) > 0) {
//                               return MyCard(
//                                 index: data['index'],
//                                 imageUrl: data['imgUrl'],
//                                 title: data['title'],
//                                 description: data['desc'],
//                                 date: data['date'],
//                                 regUrl: data['regUrl'],
//                                 tag: data['tag'],
//                                 host: data['host'],
//                                 eventresult: data['eventresult'],
//                                 gallery: data['gallery'],
//                               );
//                             }
//                             return Container();
//                           });
//                     })
//               ],
//             )
//           : Container(
//               alignment: Alignment.center,
//               child: CircularProgressIndicator(
//                   valueColor: new AlwaysStoppedAnimation<Color>(Colors.cyan)),
//             ),
//     );
//     // );
//   }

//   @override
//   void initState() {
//     crudMethods.getData().then((result) {
//       setState(() {
//         postsStream = result;
//       });
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.topRight,
//               end: Alignment.bottomLeft,
//               colors: [
//             Mycolor.secondary1,
//             Mycolor.secondary2,
//             Mycolor.secondary3
//           ])),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           title: Text("Uploads"),
//           centerTitle: true,
//           backgroundColor: Colors.transparent,
//           actions: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => CreatePost()));
//               },
//               child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: Icon(Icons.add)),
//             )
//           ],
//         ),
//         body: PostList(),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_book/Upload/card.dart';
import 'package:farm_book/Upload/crud.dart';
import 'package:farm_book/Upload/mycolor.dart';
import 'package:farm_book/Upload/uploading.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyEventPage extends StatefulWidget {
  @override
  _MyEventPageState createState() => _MyEventPageState();
}

class _MyEventPageState extends State<MyEventPage> {
  CrudMethods crudMethods = new CrudMethods();
  Stream<QuerySnapshot>? postsStream;
  bool onselectTech = true;
  bool onselectNTech = false;
  Widget PostList() {
    return SingleChildScrollView(
      child: postsStream != null
          ? Column(
              children: [
                Container(
                    margin:
                        EdgeInsets.all(MediaQuery.of(context).size.width * 0.07)
                            .copyWith(top: 0, bottom: 0),
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                onselectNTech = false;
                                onselectTech = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: onselectTech ? 50 : 0,
                              primary: onselectTech
                                  ? Colors.white
                                  : Colors.grey.shade400,
                              onPrimary: Colors.white,
                              side: BorderSide(
                                  color: onselectTech
                                      ? Colors.black
                                      : Colors.white,
                                  width: 1),
                            ),
                            child: Text(
                              "Field Related",
                              style: TextStyle(
                                  color: onselectTech
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          width: MediaQuery.of(context).size.width * 0.40,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                onselectTech = false;
                                onselectNTech = true;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: onselectNTech ? 50 : 0,
                              primary: onselectNTech
                                  ? Colors.white
                                  : Colors.grey.shade400,
                              onPrimary: Colors.white,
                              side: BorderSide(
                                  color: onselectNTech
                                      ? Colors.black
                                      : Colors.white,
                                  width: 1),
                            ),
                            child: Text(
                              "Crop Related",
                              style: TextStyle(
                                  color: onselectNTech
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: postsStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError)
                        return Text('Error = ${snapshot.error}');
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.cyan)),
                        );
                      }
                      final document = snapshot.data!.docs;
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: document.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> data =
                                document[index].data()! as Map<String, dynamic>;
                            print("tag ${data['tag']}");
                            DateTime parseDate = new DateFormat("dd-MM-yyyy")
                                .parse(data['date']);
                            DateTime currentDate =
                                DateTime.now().subtract(Duration(hours: 24));
                            print(parseDate.compareTo(currentDate) > 0);
                            if (data['tag'] == "Field related query" &&
                                onselectTech == true &&
                                parseDate.compareTo(currentDate) > 0) {
                              return MyCard(
                                index: data['index'],
                                imageUrl: data['imgUrl'],
                                title: data['title'],
                                description: data['desc'],
                                date: data['date'],
                                regUrl: data['regUrl'],
                                tag: data['tag'],
                                host: data['host'],
                                eventresult: data['eventresult'],
                                gallery: data['gallery'],
                              );
                            }
                            if (data['tag'] == "Crop" &&
                                onselectNTech == true &&
                                parseDate.compareTo(currentDate) > 0) {
                              return MyCard(
                                index: data['index'],
                                imageUrl: data['imgUrl'],
                                title: data['title'],
                                description: data['desc'],
                                date: data['date'],
                                regUrl: data['regUrl'],
                                tag: data['tag'],
                                host: data['host'],
                                eventresult: data['eventresult'],
                                gallery: data['gallery'],
                              );
                            }
                            return Container();
                          });
                    })
              ],
            )
          : Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.cyan)),
            ),
    );
  }

  @override
  void initState() {
    crudMethods.getData().then((result) {
      setState(() {
        postsStream = result;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Mycolor.secondary1,
            Mycolor.secondary2,
            Mycolor.secondary3
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("UPLOADED"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreatePost()));
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.add)),
            )
          ],
        ),
        body: PostList(),
      ),
    );
  }
}
