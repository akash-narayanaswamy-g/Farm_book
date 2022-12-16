import 'package:farm_book/farming%20products/crops.dart';
import 'package:farm_book/farming%20products/fertilizers.dart';
import 'package:farm_book/farming%20products/irrigation.dart';
import 'package:farm_book/farming%20products/machinery.dart';
import 'package:farm_book/farming%20products/seeds.dart';
import 'package:farm_book/others/updateservice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class updatepage extends StatefulWidget {
  const updatepage({Key? key}) : super(key: key);

  @override
  _updatepageState createState() => _updatepageState();
}

class _updatepageState extends State<updatepage> {
  List<Service> services = [
    Service('Crops', 'assets/upcrop.png'),
    Service('Fertilizers', 'assets/upferti.png'),
    Service('Machinery', 'assets/upmachine.png'),
    Service('Irrigation Products', 'assets/upirri.png'),
    Service('Seed', 'assets/upseed.png'),
  ];
  List<Widget> screens = [
    cropsupdate(),
    fertilizersupdate(),
    machineryupdate(),
    irrigationupdate(),
    seedsupdate()
  ];
  int selectedService = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        floatingActionButton: selectedService >= 0
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => screens[selectedService],
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                backgroundColor: Colors.green,
              )
            : null,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                    padding:
                        EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                    child: Text(
                      'FARMING PRODUCTS',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 30,
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              )
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 20.0,
                          mainAxisSpacing: 20.0,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: services.length,
                        itemBuilder: (BuildContext context, int index) {
                          return serviceContainer(services[index].imageURL,
                              services[index].name, index);
                        }),
                  ),
                ]),
          ),
        ));
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedService == index)
            selectedService = -1;
          else
            selectedService = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: selectedService == index
              ? Colors.blue.shade50
              : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue
                : Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(image, height: 80),
              SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 20),
              )
            ]),
      ),
    );
  }
}
