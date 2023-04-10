import 'dart:async';

import 'package:flutter/material.dart';

class CountDown extends ValueNotifier<int> {
  late StreamSubscription sub;
  CountDown({required int from}) : super(from) {
    sub = Stream.periodic(const Duration(seconds: 1), (v) => from - v)
        .takeWhile((value) => value >= 0)
        .listen(
      (value) {
        this.value = value;
      },
    );
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }
}
