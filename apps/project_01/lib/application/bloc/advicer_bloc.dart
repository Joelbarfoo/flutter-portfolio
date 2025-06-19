import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:project_01/domain/entities/advice_entity.dart';
import 'package:project_01/domain/failures/failures.dart';
import 'package:project_01/domain/usecases/advicer_usecases.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    final usecases = AdvicerUsecases();

    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());

      Either<Failure, AdviceEntity> adviceOrFailure = await usecases
          .getAdviceUsecase();

      emit(
        adviceOrFailure.fold(
          (failure) =>
              AdvicerStateError(message: _mapFailureToMessage(failure)),
          (advice) => AdvicerStateLoaded(advice: advice.advice),
        ),
      );
    });
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return "Server Failure";
    case GeneralFailure:
      return "General Failure";
    default:
      return "Unexpected Error";
  }
}
