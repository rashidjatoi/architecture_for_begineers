class CounterState {
  final int numb;
  CounterState({this.numb = 0});

  CounterState copyWith({int? num}) => CounterState(numb: num ?? numb);
}
