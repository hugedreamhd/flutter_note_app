import 'package:flutter_note_app/domain/repository/repository.dart';

import '../model/note.dart';

class GetNotes {
  final NoteRepository repository;

  GetNotes(this.repository);

  Future<List<Note>> call() async {
    List<Note> notes = await repository.getNote();
    return notes;
  }
}