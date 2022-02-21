import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_blocs/locator.dart';
import 'package:todo_blocs/models/todo_model.dart';
import 'package:todo_blocs/data/todo_item_repo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepo todoRepo = locator<TodoRepo>();
  TodoBloc() : super(TodoInitialState()) {
    on<TodoEvent>((event, emit) async {
      if (event is GetToDoList) {
        emit(TodoLoadingState());
        try {
          final List<ToDoItem> todoList = await todoRepo.getItemList();
          emit(TodoLoadedState(todoList: todoList));
        } catch (e) {
          emit(TodoErrorState());
        }
      } else if (event is AddTodo) {
        try {
          await todoRepo.addTodo(event.toDoItem);
          final List<ToDoItem> todoList = await todoRepo.getItemList();
          emit(TodoLoadedState(todoList: todoList));
        } catch (e) {
          emit(TodoErrorState());
        }
      } else if (event is DeleteTodo) {
        try {
          await todoRepo.deleteTodo(event.id);
          final List<ToDoItem> todoList = await todoRepo.getItemList();
          emit(TodoLoadedState(todoList: todoList));
        } catch (e) {
          emit(TodoErrorState());
        }
      }
    });
  }
}
