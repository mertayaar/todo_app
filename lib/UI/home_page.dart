import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_blocs/UI/todo_item_page.dart';
import 'package:todo_blocs/bloc/todo_bloc.dart';
import 'package:todo_blocs/models/todo_model.dart';
import 'package:todo_blocs/utils/image_covert.dart';

part 'widgets/todo_list.dart';
part 'widgets/add_todo.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context, listen: true);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 800,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: -248,
              left: -103,
              child: Container(
                  width: 1030,
                  height: 1086,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(99, 24, 175, 0.9599999785423279),
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(1030, 1086)),
                  ))),
          Positioned(
            top: -286,
            left: -103,
            child: Container(
              width: 1030,
              height: 1086,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(114, 29, 29, 0.4000000059604645),
                borderRadius: BorderRadius.all(Radius.elliptical(1030, 1086)),
              ),
            ),
          ),
          BlocBuilder(
              bloc: todoBloc,
              builder: (context, state) {
                if (state is TodoLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is TodoLoadedState) {
                  final todoList = state.todoList;

                  return ListView.builder(
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        final item = todoList[index];
                        return ListOfTodo(
                          toDoItem: item,
                        );
                      });
                }
                if (state is TodoErrorState) {
                  return const SizedBox();
                } else {
                  return const SizedBox();
                }
              }),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showDialog(
              context: context,
              builder: (context) => const AddTodoAlertDialog());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
