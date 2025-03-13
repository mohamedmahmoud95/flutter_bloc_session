
import 'package:equatable/equatable.dart';

/*
Equatable is a mixin in Dart (a programming language) that allows you to compare objects for equality based on their properties, rather than just their identity.

In other words, when you mix in Equatable to a class, you can override the props getter to specify which properties of the class should be used to determine whether two objects are equal. This is useful for comparing complex objects, such as data models or state objects.

In the context of this TimerState class, Equatable is used to compare TimerState objects based on their duration property. This means that two TimerState objects with the same duration will be considered equal, even if they are not the same object instance.
*/

sealed class TimerState extends Equatable {
  const TimerState(this.duration);
  final int duration;

  @override
  List<Object> get props => [duration];
}

final class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

final class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

final class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}