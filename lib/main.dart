import 'package:flutter/material.dart';
import 'package:flutter_note_app/presentation/notes/notes_screen.dart';
import 'package:flutter_note_app/ui/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       primaryColor: Colors.white,
        canvasColor: darkGray,
        useMaterial3: true,
        floatingActionButtonTheme:
          Theme.of(context).floatingActionButtonTheme.copyWith(
            backgroundColor: lightBlue,
            foregroundColor: darkGray
          ),
        appBarTheme:
          Theme.of(context).appBarTheme.copyWith(
            backgroundColor: darkGray,

          )
      ),
      home: const NotesScreen(),
    );
  }
}
