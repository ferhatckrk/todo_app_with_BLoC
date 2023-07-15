import 'package:flutter/material.dart';
import 'package:todo_app_bloc/widget/task_list.dart';

import '../blocs/bloc_exports.dart';

class RecyclerBinScreen extends StatelessWidget {
  static const String routeName = "recyclerbin_screen";

  const RecyclerBinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add))
          ]),
          body: SafeArea(
              child: Column(
            children: [TaskList(taskList: state.removedTasks)],
          )),
        );
      },
    );
  }
}
