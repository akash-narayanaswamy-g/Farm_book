import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:farm_book/orders/Orders.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

class fertilizersupdate extends StatefulWidget {
  const fertilizersupdate({Key? key}) : super(key: key);

  @override
  _fertilizersupdateState createState() => _fertilizersupdateState();
}

class _fertilizersupdateState extends State<fertilizersupdate> {
  var selectindex = -1;
  List datas = [
    {
      "title": "ammonium sulphate",
      "price": "4000",
      "variety": "Onion",
      "type": "InOrganic",
      "descrption": "It is Crystal type",
      "imgurl":
          "https://www.aluminummanufacturers.org/wp-content/uploads/2020/03/Ammonium-Sulfate-768x576.jpg"
    },
    {
      "title": "Urea",
      "price": "5000",
      "variety": "Cauliflower",
      "type": "InOrganic",
      "descrption": "It is prills type",
      "imgurl":
          "https://5.imimg.com/data5/DE/YF/MY-6312721/urea-pure-500x500.jpeg"
    },
    {
      "title": "Neem",
      "variety": "Tomato",
      "price": "2500",
      "type": "Organic",
      "descrption": "It is a Powder type",
      "imgurl":
          "https://cdn.shopify.com/s/files/1/0017/9234/4153/products/neemcake-710-394-croppedtest_2048x2048_81e46e21-b6a3-419a-b030-ebe248217db3_1024x1024@2x.png?v=1568040847"
    },
    {
      "title": " Phosphatic fertilizers",
      "variety": "Chilli",
      "price": "1000",
      "type": "Inorganic",
      "descrption": "It is Granules type",
      "imgurl":
          "https://www.aegean-perlites.com/wp-content/uploads/2016/06/image1-3.png"
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
    "https://m.media-amazon.com/images/I/61ECxk5BdvL._SX466_.jpg",
    "https://4.imimg.com/data4/IM/AH/MY-2413319/phosphatic-fertilizers-500x500.jpg",
    "https://m.media-amazon.com/images/I/61hJrSY3+BL._SL1200_.jpg",
    "https://cdn.cdnparenting.com/articles/2021/07/16191322/380433403.jpg",
    "https://5.imimg.com/data5/LV/WJ/MY-11203963/organic-fertilizers-500x500.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fertilizers",
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
          Text('In Stocks',
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
                      Text("Suitable For: ${variety}"),
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
