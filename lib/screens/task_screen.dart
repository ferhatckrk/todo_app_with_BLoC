import 'package:flutter/material.dart';
import 'package:todo_app_bloc/screens/add_task_screen.dart';
import 'package:todo_app_bloc/screens/my_drawer.dart';
import 'package:todo_app_bloc/widget/task_list.dart';

import '../blocs/bloc_exports.dart';

class TaskScreen extends StatefulWidget {
  static const String routeName = "task_screen";
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: AddTaskScreen(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        final tasks = state.allTasks;
        return Scaffold(
          appBar: AppBar(actions: [
            IconButton(
                onPressed: () {
                  _addTask(context);
                },
                icon: const Icon(Icons.add))
          ]),
          drawer: MyDrawer(),
          body: SafeArea(
              child: Column(
            children: [
              Text("${state.allTasks.length}"),
              TaskList(taskList: state.allTasks)
            ],
          )),
          floatingActionButton: FloatingActionButton(
              onPressed: () => _addTask(context), child: const Icon(Icons.add)),
        );
      },
    );
  }
}
