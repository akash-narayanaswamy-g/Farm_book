import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class irrigationupdate extends StatefulWidget {
  const irrigationupdate({Key? key}) : super(key: key);

  @override
  _irrigationupdateState createState() => _irrigationupdateState();
}

class _irrigationupdateState extends State<irrigationupdate> {
  CarouselController _carouselController = new CarouselController();
  int _current = 0;

  List<dynamic> _movies = [
    {
      'title': 'Drip Irrigation',
      'image':
          'https://captainpolyplast.com/images/userFiles/products/drip-irrigation-system1.jpg',
      'description':
          'Drip irrigation is sometimes called trickle irrigation and involves dripping water onto the soil at very low rates (2-20 litres/hour) from a system of small diameter plastic pipes fitted with outlets called emitters or drippers. '
    },
    {
      'title': 'Center-pivot',
      'image': 'https://img.waimaoniu.net/328/328-201808182144352210.png',
      'description':
          'Center-pivot irrigation (sometimes called central pivot irrigation), also called water-wheel and circle irrigation, is a method of crop irrigation in which equipment rotates around a pivot and crops are watered with sprinklers.'
    },
    {
      'title': 'Sprinkler',
      'image':
          'https://images.jdmagicbox.com/quickquotes/images_main/sprinkler-system-385016867-3sve5.jpg',
      'description':
          'A sprinkler system is a fire fighting device that is installed in buildings as a preventative measure. The sprinkler heads are placed in the ceilings facing toward either the floor or towards any fire hit spots.'
    }
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(
        //       Icons.logout,
        //       color: Colors.black,
        //     ),
        //   ),
        // ],
        backgroundColor: Colors.greenAccent,
        title: Center(
          child: Text(
            "Irrigation",
            style: GoogleFonts.cinzel(
              textStyle: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // actions: [
        //   IconButton(
        //       color: Colors.black,
        //       onPressed: () {
        //         showDialog(
        //             context: context,
        //             builder: (BuildContext context) {
        //               return AlertDialog(
        //                 scrollable: true,
        //                 title: Text('Manual'),
        //                 content: Padding(
        //                   padding: const EdgeInsets.all(8.0),
        //                   child: Form(
        //                     child: Column(
        //                       children: <Widget>[
        //                         Padding(
        //                           padding: EdgeInsets.all(20),
        //                           child: Text(
        //                               "A manual pdf about how to use all these machineries are provided below!!!!"),
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //                 actions: [
        //                   RaisedButton(
        //                       color: Colors.white,
        //                       child: Text("DOWNLOAD"),
        //                       onPressed: () {
        //                         // your code
        //                       })
        //                 ],
        //               );
        //             });
        //       },
        //       icon: Icon(Icons.download))
        // ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.network(_movies[_current]['image'], fit: BoxFit.cover),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                    ])),
              ),
            ),
            Positioned(
              bottom: 50,
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 500.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.70,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                carouselController: _carouselController,
                items: _movies.map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 320,
                                  margin: EdgeInsets.only(top: 30),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image.network(movie['image'],
                                      fit: BoxFit.cover),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  movie['title'],
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                // rating
                                SizedBox(height: 0),
                                Container(
                                  child: Text(
                                    movie['description'],
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey.shade600),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(height: 10),
                                AnimatedOpacity(
                                  duration: Duration(milliseconds: 500),
                                  opacity: _current == _movies.indexOf(movie)
                                      ? 1.0
                                      : 0.0,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.play_circle_filled,
                                                color: Colors.grey.shade600,
                                                size: 20,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                'Watch',
                                                style: TextStyle(
                                                    fontSize: 14.0,
                                                    color:
                                                        Colors.grey.shade600),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ));
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
