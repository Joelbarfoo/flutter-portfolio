import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    Future sleep1() {
      return Future.delayed(Duration(seconds: 2), () => "1");
    }

    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());

      // do something; get advice
      await sleep1();

      emit(
        AdvicerStateLoaded(
          advice:
              "guter rat ist teuer, das ist mir ungeheuer, ich bin ein alter räuber, haha",
        ),
      );
    });
  }
}
