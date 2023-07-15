import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/screens/recycler_bin.dart';
import 'package:todo_app_bloc/screens/task_screen.dart';
import '../blocs/bloc_exports.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: const Text("Task Drawer"),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return ListTile(
                onTap: () => Navigator.pushReplacementNamed(
                    context, TaskScreen.routeName),
                leading: const Icon(Icons.folder),
                title: const Text("My Tasks"),
                trailing: Text("${state.allTasks.length}"),
              );
            },
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return ListTile(
                onTap: () => Navigator.pushReplacementNamed(
                    context, RecyclerBinScreen.routeName),
                leading: const Icon(Icons.folder),
                title: const Text("Bin"),
                trailing: Text("${state.removedTasks.length}"),
              );
            },
          ),
          Switch(
            value: switchValue,
            onChanged: (value) => setState(
              () => switchValue = value,
            ),
          )
        ]),
      ),
    );
  }
}
