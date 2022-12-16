import 'package:flutter/material.dart';

class EChartPieBean {
  dynamic id;
  String title;
  int number;
  Color color;
  bool isClick;

  EChartPieBean(
      {this.id,
      this.title = '',
      this.number = 100,
      this.color = Colors.white,
      this.isClick = false});
}
