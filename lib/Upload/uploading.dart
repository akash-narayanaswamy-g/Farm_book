import 'dart:io';
import 'package:farm_book/Upload/crud.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:random_string/random_string.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'mycolor.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  late String title, desc, regUrl, host, tag;
  File? image;
  bool _isLoading = false;
  var selectedDate;
  CrudMethods crudMethods = new CrudMethods();
  final List<String> tags = ['None', 'Field related query', 'Crop'];

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  uploadPost() async {
    if (image != null &&
        title != "" &&
        desc != "" &&
        host != "" &&
        tag != "" &&
        tag != "None" &&
        selectedDate != null &&
        regUrl != "") {
      setState(() {
        _isLoading = true;
      });
      //uploading image to firebase Storage
      FirebaseStorage storage = FirebaseStorage.instance;
      var downloadUrl;
      Reference firebaseStorageRef = storage
          .ref()
          .child("postImages")
          .child("${randomAlphaNumeric(9)}.jpg");
      UploadTask task = firebaseStorageRef.putFile(image!);
      await task.whenComplete(() async {
        downloadUrl = await firebaseStorageRef.getDownloadURL();
      }).catchError((onError) {
        print(onError);
      });

      Map<String, dynamic> postMap = {
        "index": DateTime.now().millisecondsSinceEpoch.abs().toString(),
        "imgUrl": downloadUrl,
        "title": title,
        "desc": desc,
        "regUrl": regUrl, // tags
        "date": DateFormat('dd-MM-yyyy').format(selectedDate).toString(),
        "host": host, //crop type
        "tag": tag,
        "eventresult": "",
        "gallery": []
      };
      crudMethods.addData(postMap).then((result) {
        setState(() {
          _isLoading = true;
        });
        Navigator.pop(context);
      });
    } else {}
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2025),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
        print("Selected Date : ${selectedDate}");
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Mycolor.secondary1,
            Mycolor.secondary2,
            Mycolor.secondary3
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Upload',
            style: GoogleFonts.cinzel(
              textStyle: TextStyle(
                fontSize: 25,
                color: Colors.grey.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          actions: [
            GestureDetector(
              onTap: () {
                uploadPost();
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.file_upload)),
            )
          ],
        ),
        body: _isLoading
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.cyan)),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Tapedddd');
                          getImage();
                        },
                        child: image != null
                            ? Card(
                                clipBehavior: Clip.antiAlias,
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.file(
                                        image!,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        fit: BoxFit.cover,
                                      )
                                    ]),
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color:
                                        Colors.grey.shade200.withOpacity(0.5)),
                                width: MediaQuery.of(context).size.width,
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.black45,
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              style: TextStyle(color: Mycolor.white),
                              maxLength: 35,
                              decoration: InputDecoration(
                                  hintText: "Title",
                                  hintStyle: TextStyle(color: Colors.white38)),
                              onChanged: (val) {
                                title = val;
                              },
                            ),
                            TextField(
                              style: TextStyle(color: Mycolor.white),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                  hintText: "Crop Type",
                                  hintStyle: TextStyle(color: Colors.white38)),
                              onChanged: (val) {
                                host = val;
                              },
                            ),
                            Container(
                              height: 100,
                              child: CupertinoPicker(
                                itemExtent: 50,
                                onSelectedItemChanged: (value) {
                                  setState(() {
                                    if (value != null) {
                                      int selectedValue = value;
                                      tag = tags[selectedValue].toString();
                                    }
                                  });
                                },
                                children: [
                                  Center(
                                      child: Text(
                                    "None",
                                    style: TextStyle(color: Mycolor.white),
                                  )),
                                  Center(
                                      child: Text(
                                    "Field related query",
                                    style: TextStyle(color: Mycolor.white),
                                  )),
                                  Center(
                                      child: Text(
                                    // "Non Technical",
                                    "Crop",
                                    style: TextStyle(color: Mycolor.white),
                                  ))
                                ],
                              ),
                            ),
                            TextField(
                              style: TextStyle(color: Mycolor.white),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                  hintText: "Description",
                                  hintStyle: TextStyle(color: Colors.white38)),
                              onChanged: (val) {
                                desc = val;
                              },
                            ),
                            TextField(
                              style: TextStyle(color: Mycolor.white),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                  hintText: "Enter related Tags",
                                  hintStyle: TextStyle(color: Colors.white38)),
                              onChanged: (val) {
                                regUrl = val;
                              },
                            ),
                            Container(
                              height: 70,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      selectedDate == null
                                          ? 'No Date Chosen!'
                                          : 'query date: ${DateFormat('dd-MM-yyyy').format(selectedDate)}',
                                    ),
                                  ),
                                  RaisedButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      'Query Occured',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Mycolor.black),
                                    ),
                                    onPressed: _presentDatePicker,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          uploadPost();
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.red,
                                Colors.redAccent,
                              ],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "POST",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
