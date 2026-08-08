import 'package:equatable/equatable.dart';

import '../models/task.dart';

/// Single state class holding the current list of tasks.
///
/// The app has no async/loading/error states since everything is
/// handled synchronously in memory, so one state shape is enough.
class TaskState extends Equatable {
  final List<Task> tasks;

  const TaskState({this.tasks = const []});

  bool get isEmpty => tasks.isEmpty;

  TaskState copyWith({List<Task>? tasks}) {
    return TaskState(tasks: tasks ?? this.tasks);
  }

  @override
  List<Object?> get props => [tasks];
}
