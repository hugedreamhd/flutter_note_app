import 'package:flutter_note_app/domain/repository/repository.dart';

import '../model/note.dart';

class AddNote {
  final NoteRepository repository;

  AddNote(this.repository);

  Future<void> call(Note note) async {
    await repository.insertNote(note);
  }
}
