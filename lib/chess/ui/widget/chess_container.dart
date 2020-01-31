import 'package:dragble/chess/bloc/chess_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChessContainer extends StatefulWidget {
  final String position;
  final Color color;

  const ChessContainer({Key key, @required this.position, @required this.color})
      : super(key: key);
  @override
  _ChessContainerState createState() => _ChessContainerState();
}

class _ChessContainerState extends State<ChessContainer> {
  Color backgroundColor;
  ChessBloc chessBloc;
  String image;

  @override
  void initState() {
    chessBloc = BlocProvider.of<ChessBloc>(context);
    backgroundColor = getColor(widget.position);
    super.initState();
  }

  void onSelectFigure() {
    if (image == null) return;
    chessBloc.add(SelectFigureChessEvent(
      position: widget.position,
      figure: image,
    ));
  }

  void blocListener(ChessState state) {
    if (state is InitializedChessState) {
      image = state.positions[widget.position];
    }
    if (state is SelectedFigureChessState) {
      if (widget.position == state.position && image == state.figure) {
        backgroundColor = getColor(state.figure);
      } else {
        backgroundColor = getColor(widget.position);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChessBloc, ChessState>(
      builder: (context, state) {
        Widget child = Container();
        blocListener(state);
        if (image != null) {
          child = Image.asset('assets/$image.png');
        }
        return Expanded(
          child: GestureDetector(
            onTap: onSelectFigure,
            child: Container(
              color: backgroundColor,
              child: child,
            ),
          ),
        );
      },
    );
  }

  Color getColor(String figure) {
    Color color = widget.color;
    if (widget.position == '-') {
      return Colors.white;
    }
    switch (figure.split("_")[0]) {
      case 'red':
        return Colors.redAccent;
      case 'green':
        return Colors.greenAccent;
      case 'yellow':
        return Colors.yellowAccent;
      case 'blue':
        return Colors.blueAccent;
    }
    return color;
  }
}
