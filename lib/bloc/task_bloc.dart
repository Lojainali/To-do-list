import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../models/task.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final Uuid _uuid = const Uuid();

  TaskBloc() : super(const TaskState()) {
    on<AddTaskEvent>(_onAddTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<ToggleTaskStatusEvent>(_onToggleTaskStatus);
  }

  void _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) {
    final newTask = Task(
      id: _uuid.v4(),
      title: event.title.trim(),
      description: event.description.trim(),
    );
    emit(state.copyWith(tasks: [...state.tasks, newTask]));
  }

  void _onDeleteTask(DeleteTaskEvent event, Emitter<TaskState> emit) {
    final updated = state.tasks.where((task) => task.id != event.id).toList();
    emit(state.copyWith(tasks: updated));
  }

  void _onToggleTaskStatus(
      ToggleTaskStatusEvent event,
      Emitter<TaskState> emit,
      ) {
    final updated = state.tasks.map((task) {
      if (task.id == event.id) {
        return task.copyWith(isCompleted: !task.isCompleted);
      }
      return task;
    }).toList();
    emit(state.copyWith(tasks: updated));
  }
}
