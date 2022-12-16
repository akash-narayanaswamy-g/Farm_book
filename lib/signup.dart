import 'package:farm_book/api.dart';
import 'package:farm_book/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  _register() async {
    var data = {
      "name": namein.text,
      "email": phone_no.text,
      "password": passwordin.text
    };

    var response =
        //http://localhost:3000/addmember
        await CallApi().postData(
            data, 'https://flutter-authenticate-app.herokuapp.com/addmember');
    if (response.statusCode == 200) {
      setState(() {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return login();
        }));
      });
      Fluttertoast.showToast(
          msg: "User Added in  database",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.grey.shade400,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  final TextEditingController phone_no = TextEditingController();
  TextEditingController namein = TextEditingController();
  TextEditingController passwordin = TextEditingController();
  bool circular = false;
  final _formKey = GlobalKey<FormState>();
  final _num = GlobalKey<FormState>();
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
                "Create Account",
                style: GoogleFonts.sacramento(
                  textStyle:
                      TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black)),
                      ),
                      child: Form(
                        key: _num,
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          validator: (value) {
                            if (value == null) return 'Please Enter Number';

                            if (value.length != 10)
                              return "Number should be 10 digit";

                            return null;
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          textFieldController: phone_no,
                          formatInput: false,
                          maxLength: 10,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          cursorColor: Colors.black,
                          inputDecoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(bottom: 15, left: 0),
                            border: InputBorder.none,
                            hintText: 'Phone Number',
                            hintStyle: TextStyle(
                                color: Colors.grey.shade500, fontSize: 16),
                          ),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      left: 90,
                      top: 8,
                      bottom: 8,
                      child: Container(
                        height: 40,
                        width: 1,
                        color: Colors.black.withOpacity(0.13),
                      ),
                    )
                  ],
                ),
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
                  if (_formKey.currentState!.validate() ||
                      _num.currentState!.validate()) {
                    _register();
                    setState(() {
                      circular = true;
                    });
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
                            "Sign up",
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
                    "Already have an account?",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return login();
                        }));
                      },
                      child: Text("LOGIN"))
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
