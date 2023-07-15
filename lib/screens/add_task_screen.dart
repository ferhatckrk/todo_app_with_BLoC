import 'package:flutter/material.dart';
import 'package:todo_app_bloc/model/task.dart';
import 'package:todo_app_bloc/service/guid_gen.dart';

import '../blocs/bloc_exports.dart';

class AddTaskScreen extends StatelessWidget {
  static const String routeName = "addtaskScreen ";

  AddTaskScreen({super.key});
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text("Add Task"),
              TextField(
                controller: textController,
                autofocus: true,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel")),
                  ElevatedButton(
                      onPressed: () {
                        final task = Task(
                            title: textController.text, id: GUIDGen.generate());
                        context.read<TasksBloc>().add(AddTask(task: task));
                        Navigator.pop(context);
                      },
                      child: const Text("Add"))
                ],
              )
            ],
          ),
        ));
  }
}
