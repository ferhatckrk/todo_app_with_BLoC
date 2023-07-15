import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/screens/recycler_bin.dart';
import 'package:todo_app_bloc/screens/task_screen.dart';
import '../blocs/bloc_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

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
          const Spacer(),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.sunny),
                  Switch(
                    value: state.switchValue,
                    onChanged: (value) {
                      value
                          ? context.read<SwitchBloc>().add(SwitchOnEvent())
                          : context.read<SwitchBloc>().add(SwitchOffEvent());
                    },
                  ),
                  const Icon(Icons.nightlight),
                ],
              );
            },
          )
        ]),
      ),
    );
  }
}
