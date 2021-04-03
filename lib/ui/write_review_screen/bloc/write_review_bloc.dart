import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/write_review_screen/bloc/write_review_event.dart';
import 'package:reviewbahi/ui/write_review_screen/bloc/write_review_event.dart';
import 'package:reviewbahi/ui/write_review_screen/bloc/write_review_state.dart';





class WriteReviewBloc extends Bloc<WriteReviewEvent, WriteReviewState> {
  WriteReviewBloc() : super(null);



  @override
  Stream<WriteReviewState> mapEventToState(WriteReviewEvent event) async* {

    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield ErrorState(event.msg);
    }
  }
}