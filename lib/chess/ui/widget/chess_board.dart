import 'package:dragble/chess/ui/widget/chess_container.dart';
import 'package:dragble/util/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChessBoard extends StatefulWidget {
  @override
  _ChessBoardState createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: <Widget>[
          buildBoard(),
        ],
      ),
    );
  }

  Widget buildBoard() {
    int index = 0;
    return Container(
      height: ScreenUtil().setWidth(1080),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: board.map((itemRow) {
          List<Widget> rowWidgets = [];
          for (int i = 0; i < itemRow.length; i++) {
            Color color = Colors.black26;
            if (index % 2 == 0 && i % 2 == 0) {
              color = Colors.black12;
            } else if (index % 2 != 0 && i % 2 != 0) {
              color = Colors.black12;
            }
            rowWidgets.add(ChessContainer(position: itemRow[i], color: color));
          }
          index += 1;
          return Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: rowWidgets,
            ),
          );
        }).toList(),
      ),
    );
  }
}
