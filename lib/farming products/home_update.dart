// import 'package:farm_book/farming%20products/updatespage.dart';
// import 'package:flutter/material.dart';

// class updatebody extends StatefulWidget {
//   const updatebody({Key? key}) : super(key: key);

//   @override
//   State<updatebody> createState() => _updatebodyState();
// }

// class _updatebodyState extends State<updatebody> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => updatepage(),
//                 ),
//               );
//             },
//             child: Text("updatepage")));
//   }
// }

import 'package:farm_book/farming%20products/updatespage.dart';
import 'package:farm_book/others/updateservice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class updatebody extends StatefulWidget {
  const updatebody({Key? key}) : super(key: key);

  @override
  _updatebodyState createState() => _updatebodyState();
}

class _updatebodyState extends State<updatebody> {
  List<Service> services = [
    Service('Crops', 'assets/upcrop.png'),
    Service('Fertilizers', 'assets/upferti.png'),
    Service('Machinery', 'assets/upmachine.png'),
    Service('Irrigation Products', 'assets/upirri.png'),
    Service('Seed', 'assets/upseed.png'),
    Service("Vegetables", "assets/vegetable.png"),
    Service("Fruits", "assets/grapings.png"),
    Service("Farm Product", "assets/farmeer.png"),
  ];

  int selectedService = 4;

  // @override
  // void initState() {
  //   // Randomly select from service list every 2 seconds
  //   Timer.periodic(Duration(seconds: 2), (timer) {
  //     setState(() {
  //       selectedService = Random().nextInt(services.length);
  //     });
  //   });

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50),
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: services.length,
              itemBuilder: (BuildContext context, int index) {
                return serviceContainer(
                    services[index].imageURL, services[index].name, index);
              }),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Center(
                    child:
                        Text('Easy, reliable way \n to take care  of your Farm',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: Text(
                        'We provide you with the best people \n  to help take care of your Farm Land.',
                        style: GoogleFonts.sacramento(
                          textStyle: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 23,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: MaterialButton(
                    elevation: 0,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => updatepage(),
                        ),
                      );
                    },
                    height: 45,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: selectedService == index ? Colors.white : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue.shade100
                : Colors.grey.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(image, height: 30),
              SizedBox(
                height: 10,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 14),
              )
            ]),
      ),
    );
  }
}
