// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:todo_app_bloc/blocs/bloc_exports.dart';
import 'package:todo_app_bloc/model/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  FutureOr<void> _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;

    emit(TasksState(
        allTasks: List.from(state.allTasks)..add(event.task),
        removedTasks: state.removedTasks));
  }

  FutureOr<void> _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    int taskIndex = state.allTasks.indexOf(task);
    List<Task> allTasks = List.from(state.allTasks)..remove(task);

    task.isDone == false
        ? allTasks.insert(taskIndex, task.copyWith(isDone: true))
        : allTasks.insert(taskIndex, task.copyWith(isDone: false));

    emit(TasksState(allTasks: allTasks, removedTasks: state.removedTasks));
  }

  FutureOr<void> _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> allTaks = List.from(state.allTasks)..remove(event.task);
    emit(TasksState(
        allTasks: state.allTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.task)));
  }

  FutureOr<void> _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    List<Task> allTaks = List.from(state.allTasks)..remove(event.task);
    List<Task> removedTask = List.from(state.removedTasks)
      ..add(event.task.copyWith(isDeleted: true));
    emit(TasksState(allTasks: allTaks, removedTasks: removedTask));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
