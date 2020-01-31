part of 'chess_bloc.dart';

@immutable
abstract class ChessState extends Equatable {}

class ChessInitial extends ChessState {
  @override
  List<Object> get props => null;
}

class LoadingChessState extends ChessState {
  @override
  List<Object> get props => null;
}

class InitializedChessState extends ChessState {
  final Map positions;
  InitializedChessState({@required this.positions});
  @override
  List<Object> get props => null;
}

class SelectedFigureChessState extends ChessState {
  final String position;
  final String figure;
  SelectedFigureChessState({@required this.position, @required this.figure});
  @override
  List<Object> get props => null;
}
