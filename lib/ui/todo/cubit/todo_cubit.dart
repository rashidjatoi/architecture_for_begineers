import 'package:flutter_bloc/flutter_bloc.dart';

import 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  List<String> todos = [];

  void addTodo(String todo) {
    todos.add(todo);
    emit(TodoLoaded(List.from(todos)));
  }

  void removeTodo(String todo) {
    todos.remove(todo);
    emit(TodoLoaded(List.from(todos)));
  }
}
