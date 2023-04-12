import 'dart:math';
import 'package:flutter/foundation.dart' show immutable;

enum Action {
  rotateLeft,
  rotateRight,
  lessVisible,
  moreVisible,
}

@immutable
class State {
  final double rotationDeg;
  final double alpha;

  const State({
    required this.rotationDeg,
    required this.alpha,
  });

  const State.zero()
      : rotationDeg = 0,
        alpha = 1.0;

  State rotateRight() => State(rotationDeg: rotationDeg + 10.0, alpha: alpha);
  State rotateLeft() => State(rotationDeg: rotationDeg - 10.0, alpha: alpha);
  State decreaseAlpha() => State(
        rotationDeg: rotationDeg,
        alpha: max(alpha - 0.1, 0.0),
      );
  State increaseAlpha() => State(
        rotationDeg: rotationDeg,
        alpha: min(alpha + 0.1, 1.0),
      );
}

State reducer(State oldState, Action? action) {
  switch (action) {
    case Action.rotateLeft:
      return oldState.rotateLeft();
    case Action.rotateRight:
      return oldState.rotateRight();
    case Action.lessVisible:
      return oldState.decreaseAlpha();
    case Action.moreVisible:
      return oldState.increaseAlpha();
    case null:
      return oldState;
  }
}
