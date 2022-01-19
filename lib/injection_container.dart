import 'package:get_it/get_it.dart';
import 'package:innlabtest/logic/check/bloc/check_bloc.dart';
import 'package:innlabtest/logic/check/datasources/check_datasource.dart';
import 'package:innlabtest/logic/check/repositories/check_repository.dart';



var sl = GetIt.instance;

void initGetIt() async {
  sl.registerFactory<CheckBloc>(() => CheckBloc(sl()));

  sl.registerLazySingleton<CheckRemoteRepository>(() => CheckRemoteRepositoryImpl(sl()));

  sl.registerLazySingleton<CheckRemoteDataSource>(() => CheckRemoteDataSourceImpl());
}
