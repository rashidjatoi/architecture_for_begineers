abstract class TodoEvent {}

class AddTodo extends TodoEvent {
  final String todo;

  AddTodo(this.todo);
}

class RemoveTodo extends TodoEvent {
  final String todo;

  RemoveTodo(this.todo);
}
