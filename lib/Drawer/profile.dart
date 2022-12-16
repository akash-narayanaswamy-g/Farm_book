// import 'dart:convert';
// import 'package:farm_book/firstpage.dart';
// import 'package:flutter/material.dart';
// import '../api.dart';

// class profile extends StatefulWidget {
//   const profile({Key? key}) : super(key: key);

//   @override
//   State<profile> createState() => _profileState();
// }

// class _profileState extends State<profile> {
//   late final data;
//   // late DataModel model;
//   _getprofile() async {
//     var response = await CallApi()
//         .getnotes('https://farmbookflutter.herokuapp.com/get_user');
//     final model = jsonDecode(response.body);
//     return model;
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.greenAccent,
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Container(
//                   height: 50,
//                   width: 50,
//                   child: IconButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (_) {
//                           return mainscreen();
//                         }));
//                       },
//                       icon: Icon(Icons.arrow_back)),
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.black54),
//                       borderRadius: BorderRadius.all(Radius.circular(10))),
//                 ),
//                 Text(
//                   'PROFILE',
//                   style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
//                 ),
//                 Container(height: 24, width: 24)
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
//             child: Stack(
//               children: <Widget>[
//                 CircleAvatar(
//                   radius: 70,
//                   child: ClipOval(
//                     child: Image.asset(
//                       'assets/farmer.png',
//                       height: 150,
//                       width: 150,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                     bottom: 1,
//                     right: 1,
//                     child: Container(
//                       height: 40,
//                       width: 40,
//                       child: Icon(
//                         Icons.add_a_photo,
//                         color: Colors.white,
//                       ),
//                       decoration: BoxDecoration(
//                           color: Colors.black,
//                           borderRadius: BorderRadius.all(Radius.circular(20))),
//                     ))
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30)),
//                   gradient: LinearGradient(
//                       begin: Alignment.topRight,
//                       end: Alignment.bottomLeft,
//                       colors: [Colors.black54, Color.fromRGBO(0, 41, 102, 1)])),
//               child: Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
//                     child: Container(
//                       height: 60,
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'RAHUL',
//                             style: TextStyle(color: Colors.white70),
//                           ),
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           border:
//                               Border.all(width: 1.0, color: Colors.white70)),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                     child: Container(
//                       height: 60,
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'rahul.2001156@srec.ac.in',
//                             style: TextStyle(color: Colors.white70),
//                           ),
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           border:
//                               Border.all(width: 1.0, color: Colors.white70)),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                     child: Container(
//                       height: 60,
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             '9600942104',
//                             style: TextStyle(color: Colors.white70),
//                           ),
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           border:
//                               Border.all(width: 1.0, color: Colors.white70)),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
//                     child: Container(
//                       height: 60,
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'COIMBATORE',
//                             style: TextStyle(color: Colors.white70),
//                           ),
//                         ),
//                       ),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                           border:
//                               Border.all(width: 1.0, color: Colors.white70)),
//                     ),
//                   ),
//                   Expanded(
//                     child: Align(
//                       alignment: Alignment.bottomRight,
//                       child: Container(
//                         height: 50,
//                         width: 150,
//                         child: Align(
//                           child: InkWell(
//                             onTap: () async {
//                               data = await _getprofile();
//                               print(data);
//                             },
//                             child: Text(
//                               'EDIT',
//                               style: TextStyle(
//                                   color: Colors.white70, fontSize: 20),
//                             ),
//                           ),
//                         ),
//                         decoration: BoxDecoration(
//                             color: Colors.black45,
//                             borderRadius: BorderRadius.only(
//                               topLeft: Radius.circular(30),
//                             )),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:farm_book/Drawer/editprofile.dart';
import 'package:farm_book/firstpage.dart';
import 'package:farm_book/main.dart';
import 'package:farm_book/others/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/photos/millennial-male-team-leader-organize-virtual-workshop-with-employees-picture-id1300972574?b=1&k=20&m=1300972574&s=170667a&w=0&h=2nBGC7tr0kWIU8zRQ3dMg-C5JLo9H2sNUuDjQ5mlYfo='),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: kDarkPrimaryColor,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            'Rahul Rajamani',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            'rahulrajamani45@gmail.com',
            style: kCaptionTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Container(
            height: kSpacingUnit.w * 4,
            width: kSpacingUnit.w * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
              color: Colors.white24,
            ),
            child: Center(
              child: Text(
                'SCORE',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );

    var themeSwitcher = ThemeSwitcher(
      builder: (context) {
        return GestureDetector(
            onTap: () =>
                ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
            child: Icon(
              LineAwesomeIcons.moon,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            ));
      },
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => mainscreen()));
            },
            icon: Icon(Icons.arrow_back)),
        profileInfo,
        themeSwitcher,
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Column(
        children: <Widget>[
          SizedBox(height: kSpacingUnit.w * 5),
          header,
          Expanded(
            child: ListView(
              children: <Widget>[
                ProfileListItem(
                  icon: LineAwesomeIcons.user_shield,
                  text: 'Privacy',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.history,
                  text: 'Purchase History',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.question_circle,
                  text: 'Help & Support',
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.user_plus,
                  text: 'Invite a Friend',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
