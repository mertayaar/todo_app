part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent([List props = const []]) : super();

  @override
  List<Object> get props => [];
}

class GetToDoList extends TodoEvent {
  @override
  List<Object> get props => [];
}

class AddTodo extends TodoEvent {
  final ToDoItem toDoItem;
  AddTodo({required this.toDoItem}) : super([toDoItem]);
}

class DeleteTodo extends TodoEvent {
   final int id;
  DeleteTodo({required this.id}) : super([id]);
}
