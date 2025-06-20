import 'package:dartz/dartz.dart';
import 'package:project_01/domain/entities/advice_entity.dart';
import 'package:project_01/domain/failures/failures.dart';
import 'package:project_01/domain/repositories/advicer_repostitory.dart';
import 'package:project_01/infrastucture/repositories/advicer_repo_impl.dart';

class AdvicerUsecases {
  final AdvicerRepository advicerRepository = AdvicerRepoImpl();
  Future<Either<Failure, AdviceEntity>> getAdviceUsecase() async {
    return advicerRepository.getAdviceFromApi();
  }
}
