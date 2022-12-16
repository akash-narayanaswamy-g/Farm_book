// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:glassmorphism/glassmorphism.dart';
// import 'package:google_fonts/google_fonts.dart';

// /// Icons by svgrepo.com (https://www.svgrepo.com/collection/job-and-professions-3/)
// class statsbody extends StatefulWidget {
//   const statsbody({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => statsbodyState();
// }

// class statsbodyState extends State {
//   int touchedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 40.0),
//       child: AspectRatio(
//         aspectRatio: 1 / 2,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Card(
//                 color: Colors.white,
//                 child: AspectRatio(
//                   aspectRatio: 1,
//                   child: PieChart(
//                     PieChartData(
//                         pieTouchData: PieTouchData(touchCallback:
//                             (FlTouchEvent event, pieTouchResponse) {
//                           setState(() {
//                             if (!event.isInterestedForInteractions ||
//                                 pieTouchResponse == null ||
//                                 pieTouchResponse.touchedSection == null) {
//                               touchedIndex = -1;
//                               return;
//                             }
//                             touchedIndex = pieTouchResponse
//                                 .touchedSection!.touchedSectionIndex;
//                           });
//                         }),
//                         borderData: FlBorderData(
//                           show: false,
//                         ),
//                         sectionsSpace: 0,
//                         centerSpaceRadius: 0,
//                         sections: showingSections()),
//                   ),
//                 ),
//               ),
//               Center(
//                   child: GlassmorphicContainer(
//                 width: 350,
//                 height: 280,
//                 borderRadius: 20,
//                 blur: 1000,
//                 alignment: Alignment.bottomCenter,
//                 border: 2,
//                 linearGradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       Colors.white,
//                       Colors.white
//                     ],
//                     stops: [
//                       0.1,
//                       1,
//                     ]),
//                 borderGradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Color(0xFFffffff).withOpacity(0.5),
//                     Color((0xFFFFFFFF)).withOpacity(0.5),
//                   ],
//                 ),
//                 child: Container(
//                   child: Padding(
//                     padding: EdgeInsets.all(40),
//                     child: Center(
//                       child: Column(
//                         children: [
//                           Text(
//                               "To Know more about the crop plantation all over the region click the below button!!!",
//                               style: GoogleFonts.sacramento(
//                                 textStyle: TextStyle(
//                                     decoration: TextDecoration.none,
//                                     fontSize: 25,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold),
//                               )),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           GestureDetector(
//                             onTap: () {},
//                             child: Container(
//                               height: 50,
//                               width: 200,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 gradient: LinearGradient(
//                                   colors: [
//                                     Colors.green,
//                                     Colors.green,
//                                   ],
//                                 ),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "GET MORE INFO",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   List<PieChartSectionData> showingSections() {
//     return List.generate(7, (i) {
//       final isTouched = i == touchedIndex;
//       final fontSize = isTouched ? 30.0 : 16.0;
//       final radius = isTouched ? 100.0 : 100.0;
//       final widgetSize = isTouched ? 55.0 : 40.0;

//       switch (i) {
//         case 0:
//           return PieChartSectionData(
//             color: Colors.red,
//             value: 40,
//             title: '40%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//             badgeWidget: _Badge(
//               'assets/tomato.svg',
//               size: widgetSize,
//               borderColor: const Color(0xff0293ee),
//             ),
//             badgePositionPercentageOffset: .98,
//           );
//         case 1:
//           return PieChartSectionData(
//             color: Colors.purple,
//             value: 30,
//             title: '30%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//             badgeWidget: _Badge(
//               'assets/beetroot.svg',
//               size: widgetSize,
//               borderColor: const Color(0xfff8b250),
//             ),
//             badgePositionPercentageOffset: .98,
//           );
//         case 2:
//           return PieChartSectionData(
//             color: Colors.deepOrangeAccent,
//             value: 14,
//             title: '14%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//             badgeWidget: _Badge(
//               'assets/pumpkin.svg',
//               size: widgetSize,
//               borderColor: const Color(0xff845bef),
//             ),
//             badgePositionPercentageOffset: .98,
//           );
//         case 3:
//           return PieChartSectionData(
//             color: Colors.green,
//             value: 24,
//             title: '24%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//             badgeWidget: _Badge(
//               'assets/cabbage.svg',
//               size: widgetSize,
//               borderColor: const Color(0xff13d38e),
//             ),
//             badgePositionPercentageOffset: .98,
//           );
//         case 4:
//           return PieChartSectionData(
//             color: Colors.greenAccent.shade700,
//             value: 15,
//             title: '15%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//             badgeWidget: _Badge(
//               'assets/grapes.svg',
//               size: widgetSize,
//               borderColor: const Color(0xff13d38e),
//             ),
//             badgePositionPercentageOffset: .98,
//           );
//         case 5:
//           return PieChartSectionData(
//             color: Colors.redAccent,
//             value: 30,
//             title: '30%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//             badgeWidget: _Badge(
//               'assets/onion.svg',
//               size: widgetSize,
//               borderColor: const Color(0xff13d38e),
//             ),
//             badgePositionPercentageOffset: .98,
//           );
//         case 6:
//           return PieChartSectionData(
//             color: Colors.orange,
//             value: 5,
//             title: '5%',
//             radius: radius,
//             titleStyle: TextStyle(
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//                 color: const Color(0xffffffff)),
//             badgeWidget: _Badge(
//               'assets/carrot.svg',
//               size: widgetSize,
//               borderColor: const Color(0xff13d38e),
//             ),
//             badgePositionPercentageOffset: .98,
//           );
//         default:
//           throw 'OOPS!!';
//       }
//     });
//   }
// }

// class _Badge extends StatelessWidget {
//   final String svgAsset;
//   final double size;
//   final Color borderColor;

//   const _Badge(
//     this.svgAsset, {
//     Key? key,
//     required this.size,
//     required this.borderColor,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: PieChart.defaultDuration,
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         shape: BoxShape.circle,
//         border: Border.all(
//           color: borderColor,
//           width: 2,
//         ),
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//             color: Colors.black.withOpacity(.5),
//             offset: const Offset(3, 3),
//             blurRadius: 3,
//           ),
//         ],
//       ),
//       padding: EdgeInsets.all(size * .15),
//       child: Center(
//         child: SvgPicture.asset(
//           svgAsset,
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }


