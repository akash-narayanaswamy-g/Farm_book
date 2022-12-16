import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class mainbody extends StatefulWidget {
  const mainbody({Key? key}) : super(key: key);

  @override
  State<mainbody> createState() => _mainbodyState();
}

class _mainbodyState extends State<mainbody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.network(
          'https://assets8.lottiefiles.com/packages/lf20_s9lvjg2e.json'),
    );
  }
}
