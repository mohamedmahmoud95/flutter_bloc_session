import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/todo_cubit.dart';
import '../bloc/todo_state.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => TodoCubit(),
        child: TodoScreen(),
      ),
    );
  }
}

class TodoScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter a todo',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      todoCubit.addTodo(_controller.text);
                      _controller.clear();
                    }
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<TodoCubit, TodoState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    final todo = state.todos[index];
                    return ListTile(
                      title: Text(todo.title),
                      leading: Checkbox(
                        value: todo.isCompleted,
                        onChanged: (value) {
                          todoCubit.toggleTodo(todo.id);
                        },
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          todoCubit.removeTodo(todo.id);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}