import 'package:todo_blocs/locator.dart';
import 'package:todo_blocs/models/todo_model.dart';
import 'package:todo_blocs/data/todo_db.dart';

class TodoCrud {
  final DatabaseCheck dbcheck = locator<DatabaseCheck>();

  Future<int> addTodo(ToDoItem item) async {
    final db = await dbcheck.getDB();
    var result = db.insert("ToDoList", item.toDatabase());
    return result;
  }

   Future<List<Map<String, dynamic>>> getItems() async {
    final db = await dbcheck.getDB();
    var result = await db.query("ToDoList");
    return result;
  }

  Future<List<ToDoItem>> getItemsList() async {
    var itemMapList = await getItems();
    List<ToDoItem> itemList = [];

    for (Map<String, dynamic> map in itemMapList) {
      itemList.add(ToDoItem.fromDatabaseJson(map));
    }
    return itemList;
  }

  Future<int> deleteTodo(int id) async {
    final db = await dbcheck.getDB();
    var result = await db.delete("ToDoList", where: 'id = ?', whereArgs: [id]);
    return result;
  }
}
