import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:project_01/application/bloc/advicer_bloc.dart';
import 'package:project_01/domain/repositories/advicer_repostitory.dart';
import 'package:project_01/domain/usecases/advicer_usecases.dart';
import 'package:project_01/infrastucture/datasources/advicer_remote_datasource.dart';
import 'package:project_01/infrastucture/repositories/advicer_repo_impl.dart';

final sl = GetIt.instance; // sl == service locator

Future<void> init() async {
  //! BLoCs
  sl.registerFactory(() => AdvicerBloc(usecases: sl()));

  //! Usecases
  sl.registerLazySingleton(() => AdvicerUsecases(advicerRepository: sl()));

  //! Repositories
  sl.registerLazySingleton<AdvicerRepository>(
    () => AdvicerRepoImpl(advicerRemoteDatasource: sl()),
  );

  //! Datasource
  sl.registerLazySingleton<AdvicerRemoteDatasource>(
    () => AdvicerRemoteDatasourceImpl(client: sl()),
  );

  //! External
  sl.registerLazySingleton(() => http.Client());

  await sl.allReady();
  sl.allReady();
}
