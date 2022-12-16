// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class setting extends StatefulWidget {
//   const setting({Key? key}) : super(key: key);

//   @override
//   State<setting> createState() => _settingState();
// }

// class _settingState extends State<setting> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.settings,
//               color: Colors.black,
//             ),
//           ),
//         ],
//         backgroundColor: Colors.green.shade200,
//         title: Center(
//           child: Text(
//             "Setting",
//             style: GoogleFonts.cinzel(
//               textStyle: TextStyle(
//                   fontSize: 25,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:settings_ui/settings_ui.dart';

class setting extends StatefulWidget {
  @override
  _settingState createState() => _settingState();
}

class _settingState extends State<setting> {
  bool lockInBackground = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Text(
            'Settings UI',
            style: GoogleFonts.cinzel(
              textStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          )),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Common'),
            tiles: [
              SettingsTile(
                title: Text('Language'),

                leading: Icon(Icons.language),
                // onTap: () {
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (BuildContext context) => LanguagesScreen()));
                // },
              ),
              SettingsTile(
                  title: Text('Environment'), leading: Icon(Icons.cloud_queue)),
            ],
          ),
          SettingsSection(
            title: Text('Account'),
            tiles: [
              SettingsTile(
                  title: Text('Phone number'), leading: Icon(Icons.phone)),
              SettingsTile(title: Text('Email'), leading: Icon(Icons.email)),
              SettingsTile(
                  title: Text('Sign out'), leading: Icon(Icons.exit_to_app)),
            ],
          ),
          SettingsSection(
            title: Text('Secutiry'),
            tiles: [
              SettingsTile.switchTile(
                title: Text('Lock app in background'),
                leading: Icon(Icons.phonelink_lock),
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                  });
                },
                initialValue: null,
              ),
              SettingsTile.switchTile(
                title: Text('Use fingerprint'),
                leading: Icon(Icons.fingerprint),
                onToggle: (bool value) {},
                initialValue: null,
              ),
              SettingsTile.switchTile(
                title: Text('Change password'),
                leading: Icon(Icons.lock),
                onToggle: (bool value) {},
                initialValue: null,
              ),
            ],
          ),
          SettingsSection(
            title: Text('Misc'),
            tiles: [
              SettingsTile(
                  title: Text('Terms of Service'),
                  leading: Icon(Icons.description)),
              SettingsTile(
                  title: Text('Open source licenses'),
                  leading: Icon(Icons.collections_bookmark)),
            ],
          )
        ],
      ),
    );
  }
}

class LanguagesScreen extends StatefulWidget {
  @override
  _LanguagesScreenState createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Languages')),
    );
  }
}
