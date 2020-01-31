import 'package:dragble/chess/bloc/chess_bloc.dart';
import 'package:dragble/chess/ui/widget/chess_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChessPage extends StatefulWidget {
  @override
  _ChessPageState createState() => _ChessPageState();
}

class _ChessPageState extends State<ChessPage> {
  ChessBloc chessBloc;

  @override
  void initState() {
    chessBloc = ChessBloc();
    chessBloc.add(StartGameChessEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 1080, height: 1920, allowFontScaling: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => chessBloc,
        child: ChessBoard(),
      ),
    );
  }

  @override
  void dispose() {
    chessBloc.close();
    super.dispose();
  }
}
