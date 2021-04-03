import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/ask_detail_screen/bloc/ask_detail_event.dart';
import 'package:reviewbahi/ui/ask_detail_screen/bloc/ask_detail_state.dart';




class AskDetailBloc extends Bloc<AskDetailEvent, AskDetailState> {
  AskDetailBloc() : super(null);



  @override
  Stream<AskDetailState> mapEventToState(AskDetailEvent event) async* {

    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield ErrorState(event.msg);
    }
  }
}