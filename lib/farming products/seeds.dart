// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class cropsupdate extends StatefulWidget {
//   const cropsupdate({Key? key}) : super(key: key);

//   @override
//   State<cropsupdate> createState() => _cropsupdateState();
// }

// class _cropsupdateState extends State<cropsupdate> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Crop Variety",
//           style: GoogleFonts.cinzel(
//             textStyle: TextStyle(
//                 fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
//           ),
//         ),
//         backgroundColor: Colors.green.shade200,
//       ),
//       body: Center(
//         child: Text(
//           "CROP",
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:farm_book/orders/Orders.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

class seedsupdate extends StatefulWidget {
  const seedsupdate({Key? key}) : super(key: key);

  @override
  _seedsupdateState createState() => _seedsupdateState();
}

class _seedsupdateState extends State<seedsupdate> {
  var selectindex = -1;
  List datas = [
    {
      "title": "Paddy",
      "price": "2000",
      "variety": "Ratnagiri-3",
      "type": "Hybrid",
      "descrption": "Yeild Rate:4.0 to 4.5 t/ha",
      "imgurl": "https://sunstartv.com/wp-content/uploads/2021/06/17231.jpg"
    },
    {
      "title": "Pumpkin",
      "price": "500",
      "variety": "Fleitz Pumpkin",
      "type": "Organic",
      "descrption": "Yeild Rate:18-20 t/ha",
      "imgurl":
          "https://media.istockphoto.com/photos/roasted-salty-pumpkin-seeds-picture-id518547635?k=20&m=518547635&s=612x612&w=0&h=_yBDZ4712bir-Lumb8aGxswPJbHGI7QERe2gdsW9_Aw="
    },
    {
      "title": "Coriander",
      "variety": "APHU Dhania-1",
      "price": "300",
      "type": "Organic",
      "descrption": "Yeild Rate:150qtl/acre",
      "imgurl":
          "https://images.hindustantimes.com/img/2021/10/24/1600x900/coriander_seeds_1635062671188_1635062685759.jpg"
    },
    {
      "title": "Bitter gourd",
      "variety": "MDV- l",
      "price": "800",
      "type": "hybrid",
      "descrption": "Yeild Rate:8 to 10 t/ha",
      "imgurl":
          "http://cdn.shopify.com/s/files/1/0047/9730/0847/products/nurserylive-seeds-bitter-gourd-f1-santur-vegetable-seeds-16969056157836.jpg?v=1634202976"
    },
  ];
  int activeIndex = 0;
  int currentIndex = 0;
  Icon customicon = const Icon(Icons.search);

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        activeIndex++;
        if (activeIndex == 4) activeIndex = 0;
      });
    });

    super.initState();
  }

  final List<String> imageList = [
    "https://w0.peakpx.com/wallpaper/871/550/HD-wallpaper-different-nuts-nuts-in-the-spoons-hazelnuts-walnuts-seeds-and-nuts-nuts-concepts-hazelnut.jpg",
    "https://static3.bigstockphoto.com/1/1/4/large1500/411255898.jpg",
    "https://www.viralspices.com/wp-content/uploads/2021/09/cummin-624x312.jpg",
    "http://cdn.shopify.com/s/files/1/0047/9730/0847/products/nurserylive-seeds-bitter-gourd-f1-santur-vegetable-seeds-16969056157836.jpg?v=1634202976",
    "https://images.hindustantimes.com/img/2021/10/24/1600x900/coriander_seeds_1635062671188_1635062685759.jpg",
    "https://media.istockphoto.com/photos/roasted-salty-pumpkin-seeds-picture-id518547635?k=20&m=518547635&s=612x612&w=0&h=_yBDZ4712bir-Lumb8aGxswPJbHGI7QERe2gdsW9_Aw=",
    "https://sunstartv.com/wp-content/uploads/2021/06/17231.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Seed Variety",
          style: GoogleFonts.cinzel(
            textStyle: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.green.shade200,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: CarouselSlider.builder(
              itemCount: imageList.length,
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 200,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                reverse: false,
                aspectRatio: 5.0,
              ),
              itemBuilder: (context, i, id) {
                return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.white,
                        )),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        imageList[i],
                        width: 600,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onTap: () {
                    var url = imageList[i];
                    print(url.toString());
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('An Overview',
              style: GoogleFonts.sacramento(
                  textStyle: TextStyle(
                      fontSize: 38,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 420,
            width: double.infinity,
            child: ListView.builder(
              itemCount: datas.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    showDialogfun(
                        context,
                        datas[index]["imgurl"],
                        datas[index]["title"],
                        datas[index]["descrption"],
                        datas[index]["price"],
                        datas[index]["variety"],
                        datas[index]["type"]);
                  },
                  child: GlassmorphicContainer(
                    width: double.infinity,
                    height: 100,
                    margin: EdgeInsets.all(10),
                    borderRadius: 20,
                    blur: 200,
                    alignment: Alignment.bottomCenter,
                    border: 2,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFffffff).withOpacity(0.1),
                          Color(0xFFFFFFFF).withOpacity(0.05),
                        ],
                        stops: [
                          0.1,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFffffff).withOpacity(0.1),
                        Color((0xFFFFFFFF)).withOpacity(0.9),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        // color: Colors.grey
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(datas[index]["imgurl"]),
                                fit: BoxFit.fill),
                          ),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {});
                            },
                            icon: Icon(Icons.arrow_forward)),
                        title: Text(
                          datas[index]["title"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        isThreeLine: true,
                        subtitle: Column(
                          children: [
                            Text(
                              datas[index]["variety"],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(datas[index]["descrption"]),

                                // Text(datas[index][]),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  showDialogfun(context, img, title, descrption, price, variety, type) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 380,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          img,
                          width: 200,
                          height: 200,
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Descrption : ${descrption}"),
                      Text("Variety : ${variety}"),
                      Text("type : ${type}"),
                      Text("price : ${price}"),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => orderspage(
                                        item: title,
                                        url: img,
                                        price: price,
                                        vari: variety,
                                      )),
                            );
                          },
                          child: Text("PLACE ORDER"))
                    ]),
              ),
            ),
          );
        });
  }

  Size get preferredSize => throw UnimplementedError();
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    final lowPoint = size.height - 30;
    final highPoint = size.height - 60;
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
