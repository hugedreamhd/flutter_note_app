import 'package:flutter_note_app/domain/repository/repository.dart';

import '../model/note.dart';

class DeleteNote {
  final NoteRepository repository;

  DeleteNote(this.repository);

  Future<void> call(Note note) async {
    await repository.deleteNote(note);
  }
}