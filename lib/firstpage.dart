import 'package:farm_book/Drawer/aboutus.dart';
import 'package:farm_book/Drawer/profile.dart';
import 'package:farm_book/Drawer/setting.dart';
import 'package:farm_book/Upload/uploadhis.dart';
import 'package:farm_book/homelayout/home_body.dart';

import 'package:farm_book/farming%20products/home_update.dart';
import 'package:farm_book/homelayout/home_body.dart';
import 'package:farm_book/homestats/piechart.dart';
import 'package:farm_book/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Upload/home_upload.dart';
import 'homestats/edata.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  final storage = new FlutterSecureStorage();
  final _advancedDrawerController = AdvancedDrawerController();
  final screens = [
    mainbody(),
    upload(),
    updatebody(),
    statsbody(
      dataList: defaultList,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdropColor: Colors.green.shade300,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.0,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 158.0,
                height: 158.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  left: 20,
                  bottom: 10.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/farmlogo.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Container(
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return profile();
                          }));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white54,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.man,
                                    size: 35,
                                  )),
                              Text("PROFILE",
                                  style: GoogleFonts.cinzel(
                                    textStyle: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return MyEventPage();
                          }));
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (_) {
                          //   return MyCard(
                          //     date: '111',
                          //     description: 'ssss',
                          //     eventresult: 'eeee',
                          //     gallery: null,
                          //     host: 'aaaa',
                          //     imageUrl: 'qqqww',
                          //     index: '',
                          //     regUrl: 'wwq',
                          //     tag: 'dcsdds',
                          //     title: 'eddss',
                          //   );
                          // }));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white54,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.upload,
                                    size: 35,
                                  )),
                              Text("UPLOADS",
                                  style: GoogleFonts.cinzel(
                                    textStyle: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      // InkWell(
                      //   onTap: () {},
                      //   child: Container(
                      //     height: 50,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(30.0),
                      //       color: Colors.white54,
                      //     ),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //       children: [
                      //         IconButton(
                      //             onPressed: () {},
                      //             icon: Icon(
                      //               Icons.share,
                      //               size: 35,
                      //             )),
                      //         Text("SHARE APP",
                      //             style: GoogleFonts.cinzel(
                      //               textStyle: TextStyle(
                      //                   fontSize: 25,
                      //                   color: Colors.black,
                      //                   fontWeight: FontWeight.bold),
                      //             )),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return setting();
                          }));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white54,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.settings,
                                    size: 35,
                                  )),
                              Text("SETTING",
                                  style: GoogleFonts.cinzel(
                                    textStyle: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return aboutus();
                          }));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white54,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.group,
                                    size: 35,
                                  )),
                              Text("About Us",
                                  style: GoogleFonts.cinzel(
                                    textStyle: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await storage.deleteAll();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => firstscreen()),
                              (Route<dynamic> route) => false);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white54,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.logout_sharp,
                                    size: 35,
                                  )),
                              Text("LOG OUT",
                                  style: GoogleFonts.cinzel(
                                    textStyle: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.green.shade300,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.upload),
              label: 'Upload',
              backgroundColor: Colors.green.shade300,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.update),
              label: 'Updates',
              backgroundColor: Colors.green.shade300,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.analytics),
              label: 'Stats',
              backgroundColor: Colors.green.shade300,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
        appBar: _appBar(AppBar().preferredSize.height),
        body: screens[_selectedIndex],
      ),
    );
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _appBar(height) => PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, height + 80),
        child: Stack(
          children: <Widget>[
            Container(
              child: Center(
                child: Text(
                  "Farm Book",
                  style: GoogleFonts.cinzel(
                    textStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              color: Colors.green.shade200,
              height: height + 75,
              width: MediaQuery.of(context).size.width,
            ),
            Container(),
            Positioned(
              top: 100.0,
              left: 20.0,
              right: 20.0,
              child: AppBar(
                backgroundColor: Colors.grey,
                primary: false,
                title: TextField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.white))),
                leading: IconButton(
                  onPressed: _handleMenuButtonPressed,
                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: _advancedDrawerController,
                    builder: (_, value, __) {
                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 250),
                        child: Icon(
                          value.visible ? Icons.clear : Icons.menu,
                          key: ValueKey<bool>(value.visible),
                        ),
                      );
                    },
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ),
      );
  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
