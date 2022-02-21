part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitialState extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoErrorState extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoadingState extends TodoState {
  @override
  List<Object> get props => [];
}



class TodoLoadedState extends TodoState {
  final List<ToDoItem> todoList;
  const TodoLoadedState({required this.todoList});

  @override
  List<Object> get props => [todoList];
}
