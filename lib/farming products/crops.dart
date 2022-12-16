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

class cropsupdate extends StatefulWidget {
  const cropsupdate({Key? key}) : super(key: key);

  @override
  _cropsupdateState createState() => _cropsupdateState();
}

class _cropsupdateState extends State<cropsupdate> {
  var selectindex = -1;
  List datas = [
    {
      "title": "Tomato",
      "price": "200",
      "variety": "T-56nutri",
      "intro": "02/05/2022",
      "descrption": "Suitable:Black and Red soil",
      "imgurl": "https://wallpapercave.com/wp/wp2030790.jpg"
    },
    {
      "title": "Onion",
      "price": "100",
      "variety": "O-n539",
      "intro": "04/04/2021",
      "descrption": "Suitable:Clay and Loamy soil",
      "imgurl":
          "https://c1.wallpaperflare.com/preview/633/180/901/onions-leek-vegetables-root.jpg"
    },
    {
      "title": "Raddish",
      "variety": "Rad-24",
      "price": "300",
      "intro": "21/04/2021",
      "descrption": "Suitable:Sandy soil",
      "imgurl":
          "https://3.imimg.com/data3/LO/WP/MY-1875168/radish-white-icicle-500x500.jpg"
    },
    {
      "title": "Carrot",
      "variety": "carrot-mar21",
      "price": "250",
      "intro": "11/01/2022",
      "descrption": "Suitable:Sandy & Loamy soil",
      "imgurl":
          "https://media.istockphoto.com/photos/bundles-of-organic-carrots-with-the-stems-still-attached-picture-id185275579?b=1&k=20&m=185275579&s=170667a&w=0&h=Hwmo762tWwhVYdXqdvZukOKKrnY-7HzOcYQsBlAByGo="
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
    "https://media.istockphoto.com/photos/red-beetroot-with-green-leaves-picture-id599695694?k=20&m=599695694&s=612x612&w=0&h=Jv-6erR8zqdaqbqimmGKlSpbGxScgBVtpZG7ofwCEAA=",
    "https://c0.wallpaperflare.com/preview/596/201/219/kohl-herb-white-cabbage-cultivation.jpg",
    "https://images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-of-apples-1296x728-feature.jpg",
    "https://post.healthline.com/wp-content/uploads/2020/09/AN313-Tomatoes-732x549-Thumb-732x549.jpg",
    "https://media.istockphoto.com/photos/bundles-of-organic-carrots-with-the-stems-still-attached-picture-id185275579?b=1&k=20&m=185275579&s=170667a&w=0&h=Hwmo762tWwhVYdXqdvZukOKKrnY-7HzOcYQsBlAByGo=",
    "https://3.imimg.com/data3/LO/WP/MY-1875168/radish-white-icicle-500x500.jpg",
    "https://c1.wallpaperflare.com/preview/633/180/901/onions-leek-vegetables-root.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Crop Variety",
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
                      fontSize: 35,
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
                        datas[index]["variety"]);
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

  showDialogfun(context, img, title, descrption, price, stepcount) {
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
                        height: 10,
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
                      SizedBox(
                        height: 10,
                      ),
                      Text("Variety : ${stepcount}"),
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
                                        vari: stepcount,
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
