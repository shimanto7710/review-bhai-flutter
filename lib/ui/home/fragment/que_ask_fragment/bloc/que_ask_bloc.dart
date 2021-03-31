


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/home/fragment/que_ask_fragment/bloc/que_ask_event.dart';
import 'package:reviewbahi/ui/home/fragment/que_ask_fragment/bloc/que_ask_fragment_state.dart';

class AskBloc extends Bloc<AskEvent, AskState> {
  AskBloc() : super(null);



  @override
  Stream<AskState> mapEventToState(AskEvent event) async* {

    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield ErrorState(event.msg);
    }
  }
}