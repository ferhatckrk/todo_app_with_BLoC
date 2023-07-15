// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app_bloc/model/task.dart';
import 'package:todo_app_bloc/screens/task_screen.dart';
import 'package:todo_app_bloc/service/app_router.dart';
import 'package:todo_app_bloc/service/app_theme.dart';
import 'blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBlocOverrides.runZoned(() => runApp(const MyApp()), storage: storage);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TasksBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            theme: AppThemes.appThemeData[AppTheme.lightTheme],
            darkTheme: AppThemes.appThemeData[AppTheme.darkTheme],
            themeMode: state.switchValue ? ThemeMode.dark : ThemeMode.light,
            onGenerateRoute: (settings) =>
                AppRouter().onGenarateRoute(settings),
            title: 'Material App',
            home: const TaskScreen(),
          );
        },
      ),
    );
  }
}
