import 'package:equatable/equatable.dart';

/// Represents a single task in the Task Manager app.
///
/// Kept intentionally simple and immutable — updates are performed
/// via [copyWith] rather than mutating fields directly.
class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;

  const Task({
    required this.id,
    required this.title,
    this.description = '',
    this.isCompleted = false,
  });

  Task copyWith({
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [id, title, description, isCompleted];
}
