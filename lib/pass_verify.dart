import 'dart:async';

import 'package:farm_book/login.dart';
import 'package:farm_book/pass_reset.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class pass_verify extends StatefulWidget {
  const pass_verify({Key? key}) : super(key: key);

  @override
  State<pass_verify> createState() => _pass_verifyState();
}

class _pass_verifyState extends State<pass_verify> {
  final TextEditingController phone_no = TextEditingController();
  bool circular = false;
  final _passkey = GlobalKey<FormState>();
  bool validate = false;
  bool _isResendAgain = false;
  int otpreq = 3;
  bool _isVerified = false;
  bool _isLoading = false;

  TextEditingController emailin = TextEditingController();
  TextEditingController OTP = TextEditingController();

  // ignore: unused_field
  late Timer _timer;
  int _start = 10;
  int _currentIndex = 0;

  void resend() {
    setState(() {
      _isResendAgain = true;
    });

    const oneSec = Duration(milliseconds: 1000);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 10;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  verify() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = Duration(milliseconds: 2000);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        _isLoading = false;
        _isVerified = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Pass.png'),
                          fit: BoxFit.contain)),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.black)),
                                    ),
                                    child: Form(
                                      key: _passkey,
                                      child: InternationalPhoneNumberInput(
                                        onInputChanged: (PhoneNumber number) {
                                          print(number.phoneNumber);
                                        },
                                        validator: (value) {
                                          if (value == null)
                                            return 'Please Enter Number';

                                          if (value.length != 10)
                                            return "Number should be 10 digit";

                                          return null;
                                        },
                                        onInputValidated: (bool value) {
                                          print(value);
                                        },
                                        selectorConfig: SelectorConfig(
                                          selectorType: PhoneInputSelectorType
                                              .BOTTOM_SHEET,
                                        ),
                                        ignoreBlank: false,
                                        autoValidateMode:
                                            AutovalidateMode.disabled,
                                        selectorTextStyle:
                                            TextStyle(color: Colors.black),
                                        textFieldController: phone_no,
                                        formatInput: false,
                                        maxLength: 10,
                                        keyboardType:
                                            TextInputType.numberWithOptions(
                                                signed: true, decimal: true),
                                        cursorColor: Colors.black,
                                        inputDecoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              bottom: 15, left: 0),
                                          border: InputBorder.none,
                                          hintText: 'Phone Number',
                                          hintStyle: TextStyle(
                                              color: Colors.grey.shade500,
                                              fontSize: 16),
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
                            TextButton(
                                onPressed: () {
                                  if (_passkey.currentState!.validate()) {
                                    if (otpreq != 0 && !_isResendAgain) {
                                      resend();
                                      setState(() {
                                        otpreq--;
                                      });
                                    }
                                    setState(() {
                                      circular = false;
                                    });
                                  } else {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return login();
                                    }));
                                  }
                                },
                                child: Text(_isResendAgain
                                    ? "Try again in " + _start.toString()
                                    : "send OTP")),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                controller: OTP,
                                decoration: InputDecoration(
                                    labelText: "          OTP",
                                    border: InputBorder.none,
                                    hintText: 'Enter your OTP',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            )
                          ],
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
                          //otp verify function
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return pass_reset();
                          }));
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(133, 133, 140, 4),
                                Color.fromRGBO(143, 148, 251, .6),
                              ])),
                          child: Center(
                            child: circular
                                ? CircularProgressIndicator()
                                : Text(
                                    "VERIFY",
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
