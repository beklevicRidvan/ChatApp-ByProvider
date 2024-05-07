import 'package:get_it/get_it.dart';
import 'package:my_chat_app_byprovider/repository/database_repository.dart';
import 'package:my_chat_app_byprovider/service/auth/auth_service.dart';
import 'package:my_chat_app_byprovider/service/cloud_firestore/firestore_service.dart';

final GetIt locator = GetIt.instance;
setupLocator(){
  locator.registerLazySingleton(() => DatabaseRepository());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => FirestoreService());

}