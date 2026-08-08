import 'package:flutter_test/flutter_test.dart';
import 'package:task_manager/bloc/task_bloc.dart';
import 'package:task_manager/bloc/task_event.dart';

void main() {
  group('TaskBloc', () {
    test('initial state has no tasks', () {
      final bloc = TaskBloc();
      expect(bloc.state.tasks, isEmpty);
      bloc.close();
    });

    test('AddTaskEvent adds a task', () async {
      final bloc = TaskBloc();
      bloc.add(const AddTaskEvent(title: 'Buy milk', description: '2%'));
      await Future.delayed(Duration.zero);
      expect(bloc.state.tasks.length, 1);
      expect(bloc.state.tasks.first.title, 'Buy milk');
      expect(bloc.state.tasks.first.isCompleted, isFalse);
      bloc.close();
    });

    test('ToggleTaskStatusEvent flips completion', () async {
      final bloc = TaskBloc();
      bloc.add(const AddTaskEvent(title: 'Read book', description: ''));
      await Future.delayed(Duration.zero);
      final id = bloc.state.tasks.first.id;

      bloc.add(ToggleTaskStatusEvent(id));
      await Future.delayed(Duration.zero);
      expect(bloc.state.tasks.first.isCompleted, isTrue);

      bloc.add(ToggleTaskStatusEvent(id));
      await Future.delayed(Duration.zero);
      expect(bloc.state.tasks.first.isCompleted, isFalse);
      bloc.close();
    });

    test('DeleteTaskEvent removes the task', () async {
      final bloc = TaskBloc();
      bloc.add(const AddTaskEvent(title: 'Temp task', description: ''));
      await Future.delayed(Duration.zero);
      final id = bloc.state.tasks.first.id;

      bloc.add(DeleteTaskEvent(id));
      await Future.delayed(Duration.zero);
      expect(bloc.state.tasks, isEmpty);
      bloc.close();
    });
  });
}
