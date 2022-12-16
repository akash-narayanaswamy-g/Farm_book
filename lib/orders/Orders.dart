import 'package:farm_book/orders/ordered_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class orderspage extends StatefulWidget {
  final String item;
  final String url;
  final String price;
  final String vari;
  const orderspage(
      {required this.item,
      required this.url,
      required this.price,
      required this.vari});

  @override
  State<orderspage> createState() => _orderspageState();
}

class _orderspageState extends State<orderspage> {
  var itemIndex = 0;
  @override
  void initState() {
    super.initState();
    addItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Colors.black,
              ))
        ],
        title: Text(
          "Place Order",
          style: GoogleFonts.cinzel(
            textStyle: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color.fromRGBO(165, 214, 167, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Container(
            decoration: BoxDecoration(border: Border.all(width: 5)),
            height: 700,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Place Your Order Here!!!!",
                  style: GoogleFonts.sacramento(
                    textStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.network("${widget.url}"),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "CROP NAME:",
                          style:
                              //  GoogleFonts.cinzel(
                              // textStyle:
                              TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                          // ),
                        ),
                        Text(
                          "${widget.item}",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "QUANTITY:",
                          style:
                              // GoogleFonts.cinzel(
                              // textStyle:
                              TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            _decrementButton(itemIndex),
                            Text(
                              '${numberOfItems[itemIndex]}',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            _incrementButton(itemIndex),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "VARIETY NAME:",
                          style:
                              //  GoogleFonts.cinzel(
                              // textStyle:
                              TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                          // ),
                        ),
                        Text(
                          "${widget.vari}",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "PRICE:",
                          style:
                              // GoogleFonts.cinzel(
                              // textStyle:
                              TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                        ),
                        // ),
                        Text(
                          "Rs.${numberOfItems[itemIndex] * 3}",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    // Fluttertoast.showToast(
                    //     msg: "Order has been placed sucessfully",
                    //     toastLength: Toast.LENGTH_SHORT,
                    //     gravity: ToastGravity.BOTTOM,
                    //     timeInSecForIosWeb: 2,
                    //     backgroundColor: Colors.grey.shade400,
                    //     textColor: Colors.white,
                    //     fontSize: 16.0);
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => mainscreen(),
                    //     ),
                    //     (route) => false);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => orderplaced(),
                      ),
                    );
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
                        "Place  Order",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List numberOfItems = [];
  Widget _incrementButton(int index) {
    return FloatingActionButton(
      mini: true,
      child: Icon(Icons.add, color: Colors.black87),
      backgroundColor: Colors.grey,
      onPressed: () {
        setState(() {
          numberOfItems[index]++;
        });
      },
    );
  }

  void addItems() {
    numberOfItems.add(1);
    numberOfItems.add(2);
    numberOfItems.add(3);
    numberOfItems.add(4);
    numberOfItems.add(5);
  }

  Widget _decrementButton(int index) {
    return FloatingActionButton(
        mini: true,
        backgroundColor: Colors.grey,
        onPressed: () {},
        child: IconButton(
          onPressed: () {
            setState(() {
              numberOfItems[index]--;
            });
          },
          icon: Center(
            child: Text(
              "-",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          color: Colors.black,
        ));
  }
}
