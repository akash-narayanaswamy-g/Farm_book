import 'package:farm_book/firstpage.dart';
import 'package:farm_book/secure_storage.dart';
import 'package:farm_book/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

// var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.height;
class _MyAppState extends State<MyApp> {
  Widget page = firstscreen();
  final storage = FlutterSecureStorage();
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    var tok = await token().gettoken();
    print(tok);
    if (tok == null) {
      setState(() {
        page = firstscreen();
      });
    } else {
      setState(() {
        page = mainscreen();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return page;
  }
}

class firstscreen extends StatefulWidget {
  const firstscreen({Key? key}) : super(key: key);

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _scale2Controller;
  late AnimationController _widthController;
  late AnimationController _positionController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _scale2Animation;
  late Animation<double> _widthAnimation;
  late Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    super.initState();

    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _widthController.forward();
            }
          });

    _widthController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _positionController.forward();
            }
          });

    _positionController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                hideIcon = true;
              });
              _scale2Controller.forward();
            }
          });

    _scale2Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scale2Animation = Tween<double>(begin: 1.0, end: 32.0)
        .animate(_scale2Controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(context,
              PageTransition(type: PageTransitionType.fade, child: signup()));
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: SingleChildScrollView(
        child: Container(
            // height: double.infinity,
            // width: double.infinity,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 100,
            ),
            Image(
              image: AssetImage('assets/Farm.png'),
            ),
            Column(
              children: [
                Text(
                  "FARM BOOK",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Makes your daily farming simple!",
                  style: GoogleFonts.sacramento(
                    textStyle: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            AnimatedBuilder(
              animation: _scaleController,
              builder: (context, child) => Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _widthController,
                      builder: (context, child) => Container(
                        width: _widthAnimation.value,
                        height: 80,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.black.withOpacity(.7)),
                        child: InkWell(
                          onTap: () {
                            _scaleController.forward();
                          },
                          child: Stack(children: <Widget>[
                            AnimatedBuilder(
                              animation: _positionController,
                              builder: (context, child) => Positioned(
                                left: _positionAnimation.value,
                                child: AnimatedBuilder(
                                  animation: _scale2Controller,
                                  builder: (context, child) => Transform.scale(
                                      scale: _scale2Animation.value,
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          // gradient: LinearGradient(
                                          //   colors: [
                                          //     Color.fromRGBO(67, 163, 69, 1),
                                          //     Color.fromRGBO(143, 148, 251, .6),
                                          //   ],
                                          // ),
                                          color: Colors.green,
                                        ),
                                        child: hideIcon == false
                                            ? Icon(
                                                Icons.arrow_forward,
                                                color: Colors.white,
                                              )
                                            : Container(),
                                      )),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        )),
      ),
    );
  }
}
