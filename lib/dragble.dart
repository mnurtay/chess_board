import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DragblePage extends StatefulWidget {
  @override
  _DragblePageState createState() => _DragblePageState();
}

class _DragblePageState extends State<DragblePage> {
  bool isAccepted_1 = false;
  bool isAccepted_2 = true;

  @override
  void initState() {
    ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Container(
      child: Column(
        children: <Widget>[
          target_1(),
          target_2(),
        ],
      ),
    );
  }

  Widget draggbleWidget() {
    return Draggable<List<String>>(
      child: greenKnight(),
      feedback: greenKnight(),
      childWhenDragging: Container(),
      data: ['green', 'knight'],
    );
  }

  Widget target_1() {
    return Expanded(
      child: Container(
        color: Colors.black26,
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(1920),
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(200),
          vertical: ScreenUtil().setHeight(200),
        ),
        child: DragTarget<List<String>>(
          builder: (context, candidateData, rejectedData) {
            Widget child = Container();
            if (isAccepted_1) child = draggbleWidget();
            return child;
          },
          onWillAccept: (data) {
            return true;
          },
          onAccept: (data) {
            setState(() {
              isAccepted_1 = true;
              isAccepted_2 = false;
            });
          },
        ),
      ),
    );
  }

  Widget target_2() {
    return Expanded(
      child: Container(
        color: Colors.black26,
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(1080),
        height: ScreenUtil().setHeight(1920),
        margin: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(200),
          vertical: ScreenUtil().setHeight(200),
        ),
        child: DragTarget<List<String>>(
          builder: (context, candidateData, rejectedData) {
            Widget child = Container();
            if (isAccepted_2) child = draggbleWidget();
            return child;
          },
          onWillAccept: (data) {
            return true;
          },
          onAccept: (data) {
            setState(() {
              isAccepted_1 = false;
              isAccepted_2 = true;
            });
          },
        ),
      ),
    );
  }

  Widget greenKnight() {
    return Container(
      child: Image.asset(
        'assets/green_knight.png',
        width: ScreenUtil().setSp(400),
      ),
    );
  }

  Widget blueKnight() {
    return Container(
      child: Image.asset(
        'assets/blue_knight.png',
        width: ScreenUtil().setSp(400),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
