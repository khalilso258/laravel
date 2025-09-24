import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/note_controller.dart';

class NotesPage extends StatelessWidget {
  NotesPage({super.key});

  final NotesController controller = Get.put(NotesController());
  final TextEditingController titleCtrl = TextEditingController();
  final TextEditingController contentCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notes")),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (controller.notes.isEmpty) {
                return const Center(child: Text("No notes yet"));
              }
              return ListView.builder(
                itemCount: controller.notes.length,
                itemBuilder: (context, index) {
                  final note = controller.notes[index];
                  return ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.content),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: titleCtrl,
                  decoration: const InputDecoration(labelText: "Title"),
                ),
                TextField(
                  controller: contentCtrl,
                  decoration: const InputDecoration(labelText: "Content"),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.addNote(
                      titleCtrl.text,
                      contentCtrl.text,
                    );
                    titleCtrl.clear();
                    contentCtrl.clear();
                  },
                  child: const Text("Add Note"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
