import 'package:flutter/material.dart';

enum ChartType {
  PIE, //饼图
  LINE, //拆线
  BAR, //柱状图
}

//打开方式
enum OpenType {
  ANI, //动画
  NON, //什么也没有
}

//饼图交互
enum LoopType {
  //无交互
  NON,
  //按下时放大
  DOWN,
  //按下移动放大
  MOVE,
  //按下旋转
  DOWN_LOOP,
  //自动旋转
  AUTO_LOOP,
}
