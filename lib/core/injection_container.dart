import 'package:get_it/get_it.dart';
import 'package:innlabtest/logic/check/bloc/check_bloc.dart';
import 'package:innlabtest/logic/check/datasources/check_datasource.dart';
import 'package:innlabtest/logic/check/repositories/check_repository.dart';
import 'package:innlabtest/logic/contact/bloc/contact_bloc.dart';
import 'package:innlabtest/logic/contact/datasources/contact_datasource.dart';
import 'package:innlabtest/logic/contact/repositories/contact_repository.dart';
import 'package:innlabtest/logic/gallery/bloc/gallery_bloc.dart';
import 'package:innlabtest/logic/gallery/bloc/gallery_into_bloc.dart';
import 'package:innlabtest/logic/gallery/datasources/gallery_into_datasource.dart';
import 'package:innlabtest/logic/gallery/repositories/gallery_into_repository.dart';
import 'package:innlabtest/logic/news/bloc/news_bloc.dart';
import 'package:innlabtest/logic/news/bloc/news_into_bloc.dart';
import 'package:innlabtest/logic/news/datasources/news_datasource.dart';
import 'package:innlabtest/logic/news/datasources/news_into_datasource.dart';
import 'package:innlabtest/logic/news/repositories/news_into_repository.dart';
import 'package:innlabtest/logic/news/repositories/news_repository.dart';

import '../logic/gallery/datasources/gallery_datasource.dart';
import '../logic/gallery/repositories/gallery_repository.dart';



var sl = GetIt.instance;

void initGetIt() async {
  sl.registerFactory<CheckBloc>(() => CheckBloc(sl()));

  sl.registerLazySingleton<CheckRemoteRepository>(() => CheckRemoteRepositoryImpl(sl()));

  sl.registerLazySingleton<CheckRemoteDataSource>(() => CheckRemoteDataSourceImpl());

  sl.registerFactory<GalleryBloc>(() => GalleryBloc(sl()));

  sl.registerLazySingleton<GalleryRemoteRepository>(() => GalleryRemoteRepositoryImpl(sl()));

  sl.registerLazySingleton<GalleryRemoteDataSource>(() => GalleryRemoteDataSourceImpl());

  sl.registerFactory<GalleryIntoBloc>(() => GalleryIntoBloc(sl()));

  sl.registerLazySingleton<GalleryIntoRemoteRepository>(() => GalleryIntoRemoteRepositoryImpl(sl()));

  sl.registerLazySingleton<GalleryIntoRemoteDataSource>(() => GalleryIntoRemoteDataSourceImpl());

  sl.registerFactory<NewsBloc>(() => NewsBloc(sl()));

  sl.registerLazySingleton<NewsRemoteRepository>(() => NewsRemoteRepositoryImpl(sl()));

  sl.registerLazySingleton<NewsRemoteDataSource>(() => NewsRemoteDataSourceImpl());

  sl.registerFactory<NewsIntoBloc>(() => NewsIntoBloc(sl()));

  sl.registerLazySingleton<NewsIntoRemoteRepository>(() => NewsIntoRemoteRepositoryImpl(sl()));

  sl.registerLazySingleton<NewsIntoRemoteDataSource>(() => NewsIntoRemoteDataSourceImpl());

  sl.registerFactory<ContactBloc>(() => ContactBloc(sl()));

  sl.registerLazySingleton<ContactRemoteRepository>(() => ContactRemoteRepositoryImpl(sl()));

  sl.registerLazySingleton<ContactRemoteDataSource>(() => ContactRemoteDataSourceImpl());
}
