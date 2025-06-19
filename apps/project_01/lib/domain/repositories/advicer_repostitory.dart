

import 'package:project_01/domain/entities/advice_entity.dart';

abstract class AdvicerRepository {
  Future<AdviceEntity> getAdviceFromApi();
}