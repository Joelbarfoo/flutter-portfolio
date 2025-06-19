import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:project_01/domain/entities/advice_entity.dart';
import 'package:project_01/domain/usecases/advicer_usecases.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    final usecases = AdvicerUsecases();

    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());

      AdviceEntity advice = await usecases.getAdviceUsecase();

      emit(AdvicerStateLoaded(advice: advice.advice));
    });
  }
}
