import 'package:dartz/dartz.dart';
import 'package:project_01/domain/entities/advice_entity.dart';
import 'package:project_01/domain/failures/failures.dart';
import 'package:project_01/domain/repositories/advicer_repostitory.dart';
import 'package:project_01/infrastucture/datasources/advicer_remote_datasource.dart';
import 'package:project_01/infrastucture/exceptions/exceptions.dart';

class AdvicerRepoImpl implements AdvicerRepository {
  final AdvicerRemoteDatasource advicerRemoteDatasource;

  AdvicerRepoImpl({required this.advicerRemoteDatasource});

  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromApi() async {
    try {
      final remoteAdvice = await advicerRemoteDatasource
          .getRandomAdviceFromApi();
      return Right(remoteAdvice);
    } catch (e) {
      if (e.runtimeType is ServerException) {
        return Left(ServerFailure());
      } else {
        return Left(GeneralFailure());
      }
    }
  }
}
