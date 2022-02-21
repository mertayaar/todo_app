import 'package:todo_blocs/locator.dart';
import 'package:todo_blocs/models/todo_model.dart';
import 'package:todo_blocs/data/todo_crud.dart';

class TodoRepo {
  final TodoCrud todoCrud = locator<TodoCrud>();

  Future getItemList() async => await todoCrud.getItemsList();
  Future addTodo(ToDoItem item) async => await todoCrud.addTodo(item);
  Future deleteTodo(int id) => todoCrud.deleteTodo(id);
  Future getItemListAfterAdd() async{
    

  }
}
