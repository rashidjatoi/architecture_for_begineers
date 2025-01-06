import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/ui/todo/cubit/todo_cubit.dart';

import 'cubit/todo_state.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Add Todo input field
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Add a Todo',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  context.read<TodoCubit>().addTodo(controller.text);
                  controller.clear();
                }
              },
              child: const Text('Add Todo'),
            ),
            const SizedBox(height: 20),
            // Display Todo List
            BlocBuilder<TodoCubit, TodoState>(
              builder: (context, state) {
                if (state is TodoLoaded) {
                  final todos = state.todos;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(todos[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<TodoCubit>().removeTodo(todos[index]);
                          },
                        ),
                      );
                    },
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ],
        ),
      ),
    );
  }
}
