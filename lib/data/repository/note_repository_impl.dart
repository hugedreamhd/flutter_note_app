import 'package:flutter_note_app/domain/model/note.dart';
import 'package:flutter_note_app/domain/repository/repository.dart';

import '../data_source/note_db.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDb db;


  NoteRepositoryImpl(this.db);

  @override
  Future<void> deleteNote(Note note) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> getNote() {
    // TODO: implement getNote
    throw UnimplementedError();
  }

  @override
  Future<Note> getNoteById(int id) {
    // TODO: implement getNoteById
    throw UnimplementedError();
  }

  @override
  Future<void> insertNote(Note note) {
    // TODO: implement insertNote
    throw UnimplementedError();
  }

  @override
  Future<void> updateNote(Note note) {
    // TODO: implement updateNote
    throw UnimplementedError();
  }


}