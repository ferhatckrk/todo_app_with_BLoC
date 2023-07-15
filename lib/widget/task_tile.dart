import 'package:flutter/material.dart';
import 'package:todo_app_bloc/blocs/bloc_exports.dart';
import 'package:todo_app_bloc/model/task.dart';

class TaskTile extends StatelessWidget {
  Task task;
  TaskTile({
    required this.task,
  }) : super();

  _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title,
          style: TextStyle(
            decoration: task.isDone! ? TextDecoration.lineThrough : null,
          )),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: task.isDone,
            onChanged: task.isDeleted == false
                ? (value) {
                    context.read<TasksBloc>().add(UpdateTask(task: task));
                  }
                : null,
          ),
          IconButton(
              onPressed: () => _removeOrDeleteTask(context, task),
              icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
