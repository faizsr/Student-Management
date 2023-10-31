import 'package:flutter/material.dart';
import 'package:student_management/db/db_function.dart';
import 'package:student_management/screens/screen_addlist.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 47, 47, 58),
          ),
          scaffoldBackgroundColor: const Color(0xff201e21),
          fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: ScreenHome(),
    );
  }
}
