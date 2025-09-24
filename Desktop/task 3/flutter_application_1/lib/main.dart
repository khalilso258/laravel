import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/notes_page.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Notes App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NotesPage(),
    );
  }
}
