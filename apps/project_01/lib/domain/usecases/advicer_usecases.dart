


import 'package:project_01/domain/entities/advice_entity.dart';

class AdvicerUsecases {

  Future<AdviceEntity> getAdviceUsecase() async {

    await Future.delayed(Duration(seconds: 2));

  return AdviceEntity(advice: "test", id: 1);

    //businesslogic implementieren
  }

}