import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/repository.dart';

import '../data_source/note_db_helper.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDbHelper db;

  NoteRepositoryImpl(this.db);

  @override
  Future<void> deleteNote(Note note) async {
    await db.deleteNote(note);
  }

  @override
  Future<Note?> getNoteById(int id) async {
    return await db.getNoteById(id);
  }

  @override
  Future<List<Note>> getNote() async {
    return await db.getNotes();
  }

  @override
  Future<void> insertNote(Note note) async {
    db.insertNote(note);
  }

  @override
  Future<void> updateNote(Note note) async {
    await db.updateNote(note);
  }
}
