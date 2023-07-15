// ignore_for_file: public_member_api_docs, sort_constructors_first, use_key_in_widget_constructors
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:todo_app_bloc/blocs/bloc_exports.dart';
import 'package:todo_app_bloc/model/task.dart';
import 'package:todo_app_bloc/widget/task_tile.dart';

import '../blocs/bloc_exports.dart';

class TaskList extends StatelessWidget {
  List<Task> taskList;
  TaskList({super.key, required this.taskList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return TaskTile(task: taskList[index]);
        },
      ),
    );
  }
}
