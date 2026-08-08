# to_do

**Project structure
lib/
  models/
    task.dart               Task data model — immutable, Equatable-based
  bloc/
    task_event.dart          Events: AddTaskEvent, DeleteTaskEvent, ToggleTaskStatusEvent
    task_state.dart          Single TaskState holding the current List<Task>
    task_bloc.dart            TaskBloc: maps events to new state
  screens/
    task_list_screen.dart     Screen 1 — list, FAB, delete confirmation dialog
    add_task_screen.dart      Screen 2 — form with title/description + validation
  widgets/
    task_item.dart            Reusable task row: checkbox, status chip, delete button
    empty_state.dart          Reusable "no tasks yet" placeholder
  main.dart                   App entry point, wraps the app in BlocProvider<TaskBloc>
test/
  task_bloc_test.dart         Unit tests covering add / toggle / delete behavior
<img width="342" height="740" alt="Screenshot 2026-08-09 005932" src="https://github.com/user-attachments/assets/a8a92744-ed86-49ed-8c96-17c0cd6b4776" />
<img width="341" height="742" alt="Screenshot 2026-08-09 005906" src="https://github.com/user-attachments/assets/f7dd746b-a3e5-45da-be8a-4efd5fc933d6" />
<img width="320" height="737" alt="Screenshot 2026-08-09 005835" src="https://github.com/user-attachments/assets/d075fca6-2c3d-445a-afa6-1ba6f3ce9f46" />
<img width="365" height="807" alt="Screenshot 2026-08-09 005106" src="https://github.com/user-attachments/assets/6c710b24-919d-47cc-9814-bd207e55f9cb" />
<img width="353" height="796" alt="Screenshot 2026-08-09 004917" src="https://github.com/user-attachments/assets/4c7df7ee-1742-4cb1-9a9b-7b36a053043a" />

