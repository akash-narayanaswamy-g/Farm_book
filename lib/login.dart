import 'package:farm_book/api.dart';
import 'package:farm_book/firstpage.dart';
import 'package:farm_book/pass_verify.dart';
import 'package:farm_book/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'secure_storage.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final storage = new FlutterSecureStorage();
  TextEditingController namein = TextEditingController();
  TextEditingController passwordin = TextEditingController();
  bool circular = false;
  final _formKey = GlobalKey<FormState>();

  _logins() async {
    var data = {"name": namein.text, "password": passwordin.text};

    var response = await CallApi()
        .login(data, 'https://flutter-authenticate-app.herokuapp.com/login');
    if (response.statusCode == 404) {
      setState(() {
        circular = false;
      });
      Fluttertoast.showToast(
          msg: "No user found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (response.statusCode == 403) {
      setState(() {
        circular = false;
      });

      Fluttertoast.showToast(
          msg: "Authentication Failed, Wrong Password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (response.statusCode == 200) {
      setState(() {
        circular = false;
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => mainscreen(),
            ),
            (route) => false);
      });
      await storage.write(key: "x-auth-token", value: response.body);
      var tok = await token().gettoken();

      print("token:::::::" + tok);
      Fluttertoast.showToast(
          msg: "User logged in",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    //  final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: -50,
                        height: 400,
                        width: 400,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/farmlogo.png'),
                                  fit: BoxFit.fill)),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Login",
                style: GoogleFonts.sacramento(
                  textStyle:
                      TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black))),
                        child: TextFormField(
                          maxLength: 20,
                          controller: namein,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter username';

                            if (value.length < 5)
                              return "Username should be minimum 6letters";

                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "USERNAME",
                              border: InputBorder.none,
                              hintText: 'Enter your username',
                              hintStyle: TextStyle(color: Colors.grey[800])),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black))),
                        child: TextFormField(
                          maxLength: 20,
                          controller: passwordin,
                          validator: (value) {
                            if (value == null || value.isEmpty)
                              return 'Please enter Password';

                            if (value.length < 5)
                              return "Password should be minimum 6letters";

                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: "PASSWORD",
                              border: InputBorder.none,
                              hintText: 'Create a Password',
                              hintStyle: TextStyle(color: Colors.grey[800])),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    circular = true;
                  });
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      circular = true;
                    });
                    //login function
                    _logins();
                  } else {
                    setState(() {
                      circular = false;
                    });
                  }
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
                    child: circular
                        ? CircularProgressIndicator()
                        : Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return signup();
                      }));
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return pass_verify();
                    }));
                  },
                  child: Text(
                    "FORGET PASSWORD",
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
