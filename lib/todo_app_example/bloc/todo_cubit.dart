import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/todo_model.dart';


class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    final newTodo = Todo(id: DateTime.now().toString(), title: title);
    emit([...state, newTodo]);
  }

  void toggleTodo(String id) {
    emit(state.map((todo) {
      if (todo.id == id) {
        return Todo(id: todo.id, title: todo.title, isCompleted: !todo.isCompleted);
      }
      return todo;
    }).toList());
  }

  void removeTodo(String id) {
    emit(state.where((todo) => todo.id != id).toList());
  }
}