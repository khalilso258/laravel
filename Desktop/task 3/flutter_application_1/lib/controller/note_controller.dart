import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/note.dart';

class NotesController extends GetxController {
  var notes = <Note>[].obs;
  var isLoading = false.obs;

  final String baseUrl = "http://192.168.1.100:8000/api"; 

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  Future<void> fetchNotes() async {
    try {
      isLoading(true);
      final res = await http.get(Uri.parse('$baseUrl/all_notes'));
      if (res.statusCode == 200) {
        final List data = jsonDecode(res.body);
        notes.value = data.map((e) => Note.fromJson(e)).toList();
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> addNote(String title, String content) async {
    final res = await http.post(
      Uri.parse('$baseUrl/store_notes'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': title, 'content': content}),
    );

    if (res.statusCode == 201) {
      fetchNotes();
    }
  }
}
