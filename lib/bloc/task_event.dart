import 'package:equatable/equatable.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

/// Adds a new task with the given [title] and [description].
class AddTaskEvent extends TaskEvent {
  final String title;
  final String description;

  const AddTaskEvent({required this.title, required this.description});

  @override
  List<Object?> get props => [title, description];
}

/// Deletes the task with the given [id].
class DeleteTaskEvent extends TaskEvent {
  final String id;

  const DeleteTaskEvent(this.id);

  @override
  List<Object?> get props => [id];
}

/// Flips a task between Completed and Pending.
class ToggleTaskStatusEvent extends TaskEvent {
  final String id;

  const ToggleTaskStatusEvent(this.id);

  @override
  List<Object?> get props => [id];
}
