import 'package:dartz/dartz.dart';
import 'package:project_01/domain/entities/advice_entity.dart';
import 'package:project_01/domain/failures/failures.dart';

class AdvicerUsecases {
  Future<Either<Failure, AdviceEntity>> getAdviceUsecase() async {
    await Future.delayed(Duration(seconds: 2));

    // return Right(AdviceEntity(advice: "test", id: 1));

     return Left(ServerFailure());

  }
}
