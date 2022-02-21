import 'package:get_it/get_it.dart';
import 'package:todo_blocs/data/todo_crud.dart';
import 'package:todo_blocs/data/todo_db.dart';
import 'package:todo_blocs/data/todo_item_repo.dart';

GetIt locator = GetIt.instance;

void setupLocator() {

  locator.registerLazySingleton(() =>  TodoRepo());
  locator.registerLazySingleton(() =>  TodoCrud());
  locator.registerLazySingleton(() =>  DatabaseCheck());

}