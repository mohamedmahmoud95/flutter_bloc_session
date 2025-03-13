class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}

/*
This Dart code defines a function tick that returns a stream of integers.

The stream emits numbers counting down from ticks - 1 to 0, with a 1-second delay between each emission. The stream stops after ticks emissions.

For example, if ticks is 5, the stream will emit the numbers 4, 3, 2, 1, 0, with a 1-second delay between each number.
*/