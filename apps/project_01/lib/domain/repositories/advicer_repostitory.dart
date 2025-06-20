

import 'package:dartz/dartz.dart';
import 'package:project_01/domain/entities/advice_entity.dart';
import 'package:project_01/domain/failures/failures.dart';

abstract class AdvicerRepository {
  Future<Either<Failure, AdviceEntity>> getAdviceFromApi();
}