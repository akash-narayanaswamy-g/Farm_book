import 'dart:math';
import 'package:farm_book/homestats/echart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'elog.dart';
import 'pieenum.dart';

class statsbody extends StatelessWidget {
  final ChartType chartType;
  final List<EChartPieBean> dataList;

  statsbody({Key? key, this.chartType = ChartType.PIE, required this.dataList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChatWidget(
      dataList: dataList,
    );
  }
}

class PieChatWidget extends StatefulWidget {
  final OpenType openType;
  final LoopType loopType;
  final List<EChartPieBean> dataList;

  final int animationMills;
  final bool isLog;
  final bool isHelperLine;
  final Color bgColor;
  final int initSelect;

  final bool isLineText;

  final bool isBackground;

  final bool isFrontgText;

  final Function(int index)? clickCallBack;

  PieChatWidget({
    Key? key,
    required this.dataList,
    this.initSelect = 0,
    this.clickCallBack,
    this.loopType = LoopType.NON,
    this.openType = OpenType.ANI,
    this.isLineText = true,
    this.isBackground = true,
    this.isFrontgText = true,
    this.animationMills = 1800,
    this.isLog = false,
    this.bgColor = Colors.white,
    this.isHelperLine = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PieChatState();
  }
}

class _PieChatState extends State<PieChatWidget> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _lineAnimationController;
  late AnimationController _loopAnimationController;

  late Animation<double> _bgAnimation;

  late Animation<double> _progressAnimation;

  late Animation<double> _numberAnimation;

  int initSelect = 0;

  @override
  void initState() {
    super.initState();

    initSelect = widget.initSelect;

    PieLogUtils.isLog = widget.isLog;

    _animationController = new AnimationController(
        duration: Duration(milliseconds: widget.animationMills), vsync: this);

    _lineAnimationController = new AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);

    _loopAnimationController = new AnimationController(
        duration: Duration(milliseconds: widget.animationMills), vsync: this);

    double bgStart = 0.0;
    double bgEend = 0.5;

    double pieStart = 0.4;
    double pieEend = 0.7;
    if (!widget.isBackground) {
      pieStart = 0.0;
    }
    if (!widget.isFrontgText) {
      pieEend = 1.0;
    }
    double frontStart = 0.7;
    double frontEend = 1.0;

    _bgAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(bgStart, bgEend, curve: Curves.bounceOut),
      ),
    );

    _progressAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(pieStart, pieEend, curve: Curves.bounceOut),
      ),
    );

    _numberAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        //执行时间 区间
        curve: Interval(frontStart, frontEend, curve: Curves.bounceOut),
      ),
    );

    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _lineAnimationController.reset();
        _lineAnimationController.forward();
      }
    });
    _lineAnimationController.addListener(() {
      setState(() {});
    });
    _lineAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (widget.loopType == LoopType.AUTO_LOOP) {
          _loopAnimationController.repeat();
        }
      }
    });
    _loopAnimationController.addListener(() {
      setState(() {
        golbalStart += 0.01;
      });
    });

    if (widget.openType == OpenType.ANI) {
      if (WidgetsBinding.instance != null) {
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
          PieLogUtils.logPrint("zzzz");
          _animationController.forward();
        });
      }
    } else {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _loopAnimationController.dispose();
    _lineAnimationController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Container(
        color: widget.bgColor,
        width: 300,
        height: 500,
        child: buildStack(),
      ),
    );
  }

  double _downX = 0.0;
  double _downY = 0.0;
  bool _isMove = false;
  bool _isDown = false;
  bool _isUpdate = false;

  Stack buildStack() {
    Widget mainItemWidget = Container();
    if (widget.loopType == LoopType.NON) {
      mainItemWidget = buildCustomPaint();
    } else {
      mainItemWidget = buildGestureDetector();
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: widget.isBackground
              ? BoxDecoration(
                  color: widget.bgColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        spreadRadius: -8 * _bgAnimation.value,
                        offset: Offset(
                            -5 * _bgAnimation.value, -5 * _bgAnimation.value),
                        blurRadius: 30 * _bgAnimation.value,
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        spreadRadius: 2 * _bgAnimation.value,
                        offset: Offset(
                            5 * _bgAnimation.value, 5 * _bgAnimation.value),
                        blurRadius: 20 * _bgAnimation.value,
                      ),
                    ])
              : null,
          child: mainItemWidget,
        ),
        buildFrontTextContainer(),
      ],
    );
  }

  GestureDetector buildGestureDetector() {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        initSelect = -1;
        _isDown = true;
        _loopAnimationController.stop();
        setState(() {
          Offset localPosition = details.localPosition;
          _downY = localPosition.dy;
          _downX = localPosition.dx;
          _isMove = false;

          setState(() {});
        });
      },
      onPanStart: (DragStartDetails details) {
        Offset localPosition = details.localPosition;
        double y = localPosition.dy;
        double x = localPosition.dx;

        print("onPanStart $_downX");
      },
      onPanUpdate: (DragUpdateDetails details) {
        Offset localPosition = details.localPosition;
        double dx = localPosition.dx;
        double dy = localPosition.dy;

        if (widget.loopType == LoopType.DOWN_LOOP) {
          _downY = dy;
          _downX = dx;

          _isMove = true;
          setState(() {});
        } else if (widget.loopType == LoopType.AUTO_LOOP ||
            widget.loopType == LoopType.MOVE) {
          _downY = dy;
          _downX = dx;
          _isMove = false;
          setState(() {});
        }
      },
      onTapUp: (TapUpDetails details) {
        _isUpdate = true;
        Offset localPosition = details.localPosition;
        if (widget.loopType == LoopType.AUTO_LOOP) {
          _loopAnimationController.repeat();
        }
        _isDown = false;
      },
      onPanCancel: () {
        if (widget.loopType == LoopType.AUTO_LOOP) {
          _loopAnimationController.repeat();
        }
      },
      onPanEnd: (DragEndDetails details) {
        if (widget.loopType == LoopType.AUTO_LOOP) {
          _loopAnimationController.repeat();
        }
      },
      child: buildCustomPaint(),
    );
  }

  CustomPaint buildCustomPaint() {
    return CustomPaint(
      size: MediaQuery.of(context).size,
      painter: CustomShapPainter(
        widget.dataList,
        initSelect: initSelect,
        pieProgress: _progressAnimation.value,
        lineProgress: _lineAnimationController.value,
        downX: _downX,
        downY: _downY,
        loopType: widget.loopType,
        startRadin: golbalStart,
        isDrawLine: widget.isLineText,
        isDrawHelper: widget.isHelperLine,
        isMove: _isMove,
        clickCallBack: (int value) {
          currentSelect = value;
          PieLogUtils.logPrint("点击回调 $value");

          SchedulerBinding.instance!.addPostFrameCallback((Duration timeStamp) {
            PieLogUtils.logPrint("刷新 $_isUpdate");
            if (widget.isFrontgText && _isUpdate) {
              _isUpdate = false;
              setState(() {});
            }
            if (widget.clickCallBack != null && _isUpdate) {
              widget.clickCallBack!(value);
            }
          });
        },
      ),
    );
  }

  Container buildFrontTextContainer() {
    if (!widget.isFrontgText) {
      return Container();
    }
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: widget.bgColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              spreadRadius: 3 * _numberAnimation.value,
              blurRadius: 5 * _numberAnimation.value,
              offset: Offset(
                  5 * _numberAnimation.value, 5 * _numberAnimation.value),
              color: Colors.black54),
        ],
      ),
      child: Center(
        child: Text(
          "STATS",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }

  int currentSelect = 0;
}

double golbalStart = 0.0;

class CustomShapPainter extends CustomPainter {
  List<EChartPieBean> list;

  Function(int index)? clickCallBack;
  double pieProgress;
  double lineProgress;
  bool isDrawLine;
  bool isDrawHelper;
  LoopType loopType;
  int initSelect;

  CustomShapPainter(this.list,
      {required this.pieProgress,
      required this.lineProgress,
      this.initSelect = -1,
      this.downX = 0.0,
      this.downY = 0.0,
      this.loopType = LoopType.DOWN,
      this.isMove = false,
      this.startRadin = 0.0,
      this.isDrawLine = true,
      this.isDrawHelper = false,
      this.clickCallBack,
      this.isLog = false});

  Paint _paint = new Paint()
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..strokeWidth = 2.0;

  TextPainter _textPainter = TextPainter(
    textDirection: TextDirection.ltr,
    maxLines: 1,
  );

  double downX;
  double downY;
  bool isLog;

  bool isMove;
  double radius = 0;
  double line1 = 0.0;
  double line2 = 0.0;
  double startRadin = 0.0;
  int currentSelect = 0;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width > size.height) {
      radius = size.height / 3;
    } else {
      radius = size.width / 3;
    }

    if (lineProgress > 0.1) {
      line1 = radius / 3;
      line2 = radius * lineProgress;
    }

    canvas.translate(size.width / 2, size.height / 2);

    downY -= size.height / 2;
    downX -= size.width / 2;
    PieLogUtils.logPrint("手指按下的位置 downX $downX downY $downY");
    var calculatorDegree2 = atan2(downY, downX);
    if (downY < 0) {
      calculatorDegree2 = 2 * pi - calculatorDegree2.abs();
    } else {}

    PieLogUtils.logPrint("aaaaa");

    double total = 0.0;
    list.forEach((element) {
      total += element.number;
    });

    if (loopType == LoopType.DOWN_LOOP || loopType == LoopType.AUTO_LOOP) {
      if (isMove) {
        startRadin = atan2(downY, downX);
        print("bbbbb $startRadin");
      }
    }

    golbalStart = startRadin;

    calculatorDegree2 -= golbalStart;

    if (calculatorDegree2 >= (2 * pi)) {
      print("Degree $calculatorDegree2");
      calculatorDegree2 = calculatorDegree2 - 2 * pi;
      print("Degree $calculatorDegree2");
    }

    if (calculatorDegree2 < 0) {
      calculatorDegree2 = 2 * pi - calculatorDegree2.abs();
    }

    for (var i = 0; i < list.length; i++) {
      var entity = list[i];
      _paint.color = entity.color;

      double flag = entity.number / total;

      double sweepRadin = flag * 2 * pi * pieProgress;

      double unitNumber = entity.number / total;

      double endRadin = startRadin + sweepRadin;

      double tagRadius = radius;

      if (initSelect != -2) {
        if (initSelect == -1 &&
            !isMove &&
            calculatorDegree2 > (startRadin - golbalStart) &&
            calculatorDegree2 <= (endRadin - golbalStart)) {
          tagRadius += 10;
          currentSelect = i;
        } else {
          if (i == initSelect) {
            tagRadius += 13;
            currentSelect = i;
          }
        }
      }

      PieLogUtils.logPrint(
          "Degree $calculatorDegree2  startRadin $startRadin endRadin $endRadin");

      canvas.drawArc(Rect.fromCircle(center: Offset(0, 0), radius: tagRadius),
          startRadin, sweepRadin, true, _paint);

      if (isDrawLine) {
        _drawLineAndText(canvas, startRadin + sweepRadin / 2, sweepRadin,
            tagRadius, entity.title, entity.color, unitNumber);
      }

      startRadin += sweepRadin;
    }
    if (isDrawHelper) {
      _paint.color = Colors.black54;
      _paint.style = PaintingStyle.stroke;
      canvas.drawArc(Rect.fromCircle(center: Offset(0, 0), radius: radius),
          golbalStart, calculatorDegree2, true, _paint);
      canvas.drawCircle(Offset(downX, downY), 20, _paint);
    }

    if (pieProgress >= 1.0) {
      if (clickCallBack != null) {
        clickCallBack!(currentSelect);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _drawLineAndText(Canvas canvas, double currentAngle, double angle,
      double r, String name, Color color, double unitNumber) {
    var startX = r * (cos(currentAngle));
    var startY = r * (sin(currentAngle));
    var stopX = (r + line1) * (cos(currentAngle));
    var stopY = (r + line1) * (sin(currentAngle));

    var endX;
    if (stopX - startX > 0) {
      endX = stopX + line2;
    } else {
      endX = stopX - line2;
    }

    canvas.drawLine(Offset(startX, startY), Offset(stopX, stopY), _paint);
    canvas.drawLine(Offset(stopX, stopY), Offset(endX, stopY), _paint);

    var offset = 4;

    var tp = _newVerticalAxisTextPainter(name, color);
    tp.layout();

    var w = tp.width;

    var textStartX;
    if (stopX - startX > 0) {
      if (w > line2) {
        textStartX = (stopX + offset);
      } else {
        textStartX = (stopX + (line2 - w) / 4);
      }
    } else {
      if (w > line2) {
        textStartX = (stopX - offset - w);
      } else {
        textStartX = (stopX - (line2 - w) / 4 - w);
      }
    }
    if (lineProgress >= 1.0) {
      tp.paint(canvas, Offset(textStartX, stopY + offset));
    }

    var per = "${(unitNumber * 100).round().toInt()}%";

    var tpPre = _newVerticalAxisTextPainter(per, color);
    tpPre.layout();

    w = tpPre.width;
    var h = tpPre.height;

    if (stopX - startX > 0) {
      if (w > line2) {
        textStartX = (stopX + offset);
      } else {
        textStartX = (stopX + (line2 - w) / 4);
      }
    } else {
      if (w > line2) {
        textStartX = (stopX - offset - w);
      } else {
        textStartX = (stopX - (line2 - w) / 4 - w);
      }
    }

    if (lineProgress >= 0.5) {
      tpPre.paint(canvas, Offset(textStartX, stopY - offset - h));
    }
  }

  TextPainter _newVerticalAxisTextPainter(String text, Color color) {
    return _textPainter
      ..text = TextSpan(
        text: text,
        style: new TextStyle(
          color: color,
          fontSize: 12.0,
        ),
      );
  }

  double calculatorDegree(
      double x1, double y1, double x2, double y2, double x3, double y3) {
    double radian = 0;

    double ab = getDistance(x1, y1, x2, y2);
    double ac = getDistance(x1, y1, x3, y3);
    double bc = getDistance(x2, y2, x3, y3);

    double value = (ab * ab + ac * ac - (bc * bc)) / (2 * ab * ac);

    radian = acos(value);

    return radian;
  }

  double getDistance(double x1, double y1, double x2, double y2) {
    double distance = 0;
    distance = sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
    return distance;
  }
}
