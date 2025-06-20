import 'package:dartz/dartz.dart';
import 'package:project_01/domain/entities/advice_entity.dart';
import 'package:project_01/domain/failures/failures.dart';
import 'package:project_01/domain/repositories/advicer_repostitory.dart';
import 'package:project_01/infrastucture/datasources/advicer_remote_datasource.dart';

class AdvicerRepoImpl implements AdvicerRepository {
  final AdvicerRemoteDatasource advicerRemoteDatasource =
      AdvicerRemoteDatasourceImpl();
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromApi() async {
    final remoteAdvice = await advicerRemoteDatasource.getRandomAdviceFromApi();
    return Right(remoteAdvice);
  }
}
