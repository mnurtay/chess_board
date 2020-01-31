import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dragble/util/config.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'chess_event.dart';
part 'chess_state.dart';

class ChessBloc extends Bloc<ChessEvent, ChessState> {
  @override
  ChessState get initialState => ChessInitial();

  @override
  Stream<ChessState> mapEventToState(
    ChessEvent event,
  ) async* {
    if (event is StartGameChessEvent) {
      yield LoadingChessState();
      yield InitializedChessState(positions: positions);
    }
    if (event is SelectFigureChessEvent) {
      yield LoadingChessState();
      yield SelectedFigureChessState(
          position: event.position, figure: event.figure);
    }
  }
}
