import 'package:flutter/foundation.dart';
import 'package:nirogi/src/models/models.dart';

abstract class BmiEvent {}

class BmiAddevent extends BmiEvent {
  final Bmi bmi;

  BmiAddevent({
    @required this.bmi,
  });
}

class BmiGetEvent extends BmiEvent {}

class BmiClearEvent extends BmiEvent {}
