// import 'package:flutter/material.dart';
// import 'package:glassmorphism/glassmorphism.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ordereditems extends StatefulWidget {
//   final String item;
//   final String url;
//   final String price;
//   final String vari;
//   const ordereditems(
//       {required this.item,
//       required this.url,
//       required this.price,
//       required this.vari});

//   @override
//   State<ordereditems> createState() => _ordereditemsState();
// }

// class _ordereditemsState extends State<ordereditems> {

//   List<Map> datas =[];

// datas.add(add_item);

// @override
//   void initState() {

// Map add_item={
// "title": widget.item,
// "url":widget.url,
// "price":widget.price,
// "variety":widget.vari
//   };
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.green.shade200,
//         title: Text(
//           "Your Orders",
//           style: GoogleFonts.cinzel(
//             textStyle: TextStyle(
//                 fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//       body:  Container(
//             height: double.infinity,
//             width: double.infinity,
//             child: ListView.builder(
//               itemCount: datas.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     showDialogfun(
//                         context,
//                         datas[index]["imgurl"],
//                         datas[index]["title"],
//                         datas[index]["descrption"],
//                         datas[index]["price"],
//                         datas[index]["variety"]);
//                   },
//                   child: GlassmorphicContainer(
//                     width: double.infinity,
//                     height: 100,
//                     margin: EdgeInsets.all(10),
//                     borderRadius: 20,
//                     blur: 200,
//                     alignment: Alignment.bottomCenter,
//                     border: 2,
//                     linearGradient: LinearGradient(
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                         colors: [
//                           Color(0xFFffffff).withOpacity(0.1),
//                           Color(0xFFFFFFFF).withOpacity(0.05),
//                         ],
//                         stops: [
//                           0.1,
//                           1,
//                         ]),
//                     borderGradient: LinearGradient(
//                       begin: Alignment.topLeft,
//                       end: Alignment.bottomRight,
//                       colors: [
//                         Color(0xFFffffff).withOpacity(0.1),
//                         Color((0xFFFFFFFF)).withOpacity(0.9),
//                       ],
//                     ),
//                     child: Container(
//                       margin: EdgeInsets.all(20),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20.0),
//                         // color: Colors.grey
//                       ),
//                       child: ListTile(
//                         leading: Container(
//                           width: 40,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                                 image: NetworkImage(datas[index]["imgurl"]),
//                                 fit: BoxFit.fill),
//                           ),
//                         ),
//                         trailing: IconButton(
//                             onPressed: () {
//                               setState(() {});
//                             },
//                             icon: Icon(Icons.arrow_forward)),
//                         title: Text(
//                           datas[index]["title"],
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         isThreeLine: true,
//                         subtitle: Column(
//                           children: [
//                             Text(
//                               datas[index]["variety"],
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(datas[index]["descrption"]),

//                                 // Text(datas[index][]),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//     ));
//   }

//   showDialogfun(context, img, title, descrption, price, stepcount) {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return Center(
//             child: Material(
//               type: MaterialType.transparency,
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.7,
//                 height: 380,
//                 padding: EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15.0),
//                     color: Colors.white),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(5),
//                         child: Image.network(
//                           img,
//                           width: 200,
//                           height: 200,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             title,
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black),
//                           )
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text("Descrption : ${descrption}"),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text("Variety : ${stepcount}"),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             primary: Colors.green,
//                           ),
//                           onPressed: () {
//                             // Navigator.push(
//                             //   context,
//                             //   MaterialPageRoute(
//                             //       builder: (context) => orderspage(
//                             //             item: title,
//                             //             url: img,
//                             //             price: price,
//                             //             vari: stepcount,
//                             //           )),
//                             // );
//                           },
//                           child: Text("TRACK ORDER"))
//                     ]),
//               ),
//             ),
//           );
//         });
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../firstpage.dart';

class orderplaced extends StatefulWidget {
  const orderplaced({Key? key}) : super(key: key);

  @override
  State<orderplaced> createState() => _orderplacedState();
}

class _orderplacedState extends State<orderplaced> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Text(
            "CONGRATULATIONS",
            style: GoogleFonts.cinzel(
              textStyle: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Lottie.network(
              'https://assets1.lottiefiles.com/packages/lf20_sabvcsrv.json'),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Your item has been \n placed successfully",
              style: GoogleFonts.cinzel(
                textStyle: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => mainscreen(),
                  ),
                  (route) => false);
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.green,
                    Colors.green,
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  "Home Page",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
