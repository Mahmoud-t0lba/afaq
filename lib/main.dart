import 'package:afaq/home.dart';
import 'package:afaq/todo_test/screens/tasks_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      locale: Locale('ar'),
      debugShowCheckedModeBanner: false,
      home:
          // DateTime.now().isBefore(DateTime(2022, 3, 11))
          //     ? const Tasks_Screen()
          //     :
          MyHomePage(),
      //   home: MyHomePage(),
    );
  }
}
