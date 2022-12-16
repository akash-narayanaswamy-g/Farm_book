// ignore_for_file: deprecated_member_use

import 'package:farm_book/Upload/mycolor.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../Upload/crud.dart';

// ignore: must_be_immutable
class MyCard extends StatefulWidget {
  final String index,
      imageUrl,
      title,
      description,
      date,
      regUrl,
      host,
      tag,
      eventresult;
  var gallery;
  MyCard(
      {required this.index,
      required this.imageUrl,
      required this.title,
      required this.description,
      required this.date,
      required this.regUrl,
      required this.host,
      required this.tag,
      required this.eventresult,
      required this.gallery});

  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  CrudMethods crudMethods = new CrudMethods();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          child: Card(
              elevation: 10,
              clipBehavior: Clip.antiAlias,
              color: Colors.grey.shade200.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Stack(children: [
                      CachedNetworkImage(
                        imageUrl: widget.imageUrl,
                        placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                          valueColor:
                              new AlwaysStoppedAnimation<Color>(Colors.cyan),
                        )),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        height: MediaQuery.of(context).size.height * 0.35,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16).copyWith(bottom: 0),
                    child: Text(
                      widget.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16).copyWith(bottom: 0),
                    child: Text(
                      widget.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "QUERY DATE: ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.date,
                                style: TextStyle(fontSize: 15),
                              )
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: RaisedButton(
                          child: Text(
                            'QUERY STATUS',
                            style: TextStyle(color: Mycolor.black),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => MyCardView(
                            //               index: widget.index,
                            //               imageUrl: widget.imageUrl,
                            //               title: widget.title,
                            //               description: widget.description,
                            //               date: widget.date,
                            //               regUrl: widget.regUrl,
                            //               host: widget.host,
                            //               tag: widget.tag,
                            //               eventresult: widget.eventresult,
                            //               gallery: widget.gallery,
                            //             )));
                          },
                        ),
                      )
                    ],
                  )
                ],
              ))),
      Positioned(
          top: 20,
          right: 20,
          child: InkWell(
            onTap: () {
              crudMethods.deletepost(widget.index);
              crudMethods.deleteimage(widget.imageUrl);
            },
            child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                )),
          ))
    ]);
  }
}
