import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double projectStatus(
  int? numToDoTasks,
  int? numDoneTasks,
) {
  // Sum the percentage of tasks complete and divide by 100
  // The Class Function can only be used when the scope of operation is the same Class:
  double _percentageToDo = numToDoTasks! / (numToDoTasks + numDoneTasks!) * 100;
  return _percentageToDo; // example usage: projectStatus(5,10) ==> 80.00%
}

double projectStatusalt(
  int? numToDoTasks,
  int? numDoneTasks,
) {
  // Sum the number of tasks complete and convert to a 0 - 1.0 scale
  assert(numToDoTasks! >= 0);
  assert(numDoneTasks! >= 0);
  if (numDoneTasks == numToDoTasks) {
    return 1.0;
  }
  return numDoneTasks!.toDouble() /
      (numToDoTasks!.toDouble() + numDoneTasks.toDouble());
}
