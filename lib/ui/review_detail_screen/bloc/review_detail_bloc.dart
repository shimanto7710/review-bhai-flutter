import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reviewbahi/ui/review_detail_screen/bloc/review_detail_event.dart';
import 'package:reviewbahi/ui/review_detail_screen/bloc/review_detail_state.dart';



class ReviewDetailBloc extends Bloc<ReviewDetailEvent, ReviewDetailState> {
  ReviewDetailBloc() : super(null);



  @override
  Stream<ReviewDetailState> mapEventToState(ReviewDetailEvent event) async* {

    if (event is InitEvent) {
      yield InitState();
    }
    if (event is ErrorEvent) {
      yield ErrorState(event.msg);
    }
  }
}