import 'package:flutter/material.dart';
import 'package:todo_app_bloc/screens/add_task_screen.dart';
import 'package:todo_app_bloc/screens/recycler_bin.dart';
import 'package:todo_app_bloc/screens/task_screen.dart';

class AppRouter {
  Route onGenarateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case TaskScreen.routeName:
        return MaterialPageRoute(builder: (_) => const TaskScreen());
      case AddTaskScreen.routeName:
        return MaterialPageRoute(builder: (_) => AddTaskScreen());
      case RecyclerBinScreen.routeName:
        return MaterialPageRoute(builder: (_) => const RecyclerBinScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text("Sayfa bulunamadı!")),
                ));
    }
  }
}
