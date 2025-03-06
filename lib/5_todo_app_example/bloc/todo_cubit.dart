import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/todo_model.dart';
import 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState([]));

  void addTodo(String title) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: title,
    );
    emit(TodoState([...state.todos, newTodo]));
  }

  void toggleTodo(String id) {
    emit(TodoState(state.todos.map((todo) {
      if (todo.id == id) {
        return Todo(
          id: todo.id,
          title: todo.title,
          isCompleted: !todo.isCompleted,
        );
      }
      return todo;
    }).toList()));
  }

  void removeTodo(String id) {
    emit(TodoState(state.todos.where((todo) => todo.id != id).toList()));
  }
}