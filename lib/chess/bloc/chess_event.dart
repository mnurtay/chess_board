part of 'chess_bloc.dart';

@immutable
abstract class ChessEvent extends Equatable {}

class StartGameChessEvent extends ChessEvent {
  @override
  List<Object> get props => null;
}

class SelectFigureChessEvent extends ChessEvent {
  final String position;
  final String figure;
  SelectFigureChessEvent({@required this.position, @required this.figure});
  @override
  List<Object> get props => null;
}
