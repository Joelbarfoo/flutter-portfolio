import 'dart:convert';

import 'package:project_01/domain/entities/advice_entity.dart';
import "package:http/http.dart" as http;
import 'package:project_01/infrastucture/exceptions/exceptions.dart';
import 'package:project_01/infrastucture/models/advice_model.dart';

abstract class AdvicerRemoteDatasource {
  /// requests a random advice from free api
  /// throws a server-exception if respond code is not 200
  Future<AdviceEntity> getRandomAdviceFromApi();
}

class AdvicerRemoteDatasourceImpl implements AdvicerRemoteDatasource {
  final http.Client client;

  AdvicerRemoteDatasourceImpl({required this.client});

  @override
  Future<AdviceEntity> getRandomAdviceFromApi() async {
    final response = await client.get(
      Uri.parse("https://api.adviceslip.com/advice"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);

      return AdviceModel.fromJson(responseBody["slip"]);
    }
  }
}
