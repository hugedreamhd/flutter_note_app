import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/repository/repository.dart';
import 'package:flutter_note_app/presentation/notes/notes_event.dart';

import '../../domain/model/note.dart';
import '../../domain/repository/repository.dart';

class NotesViewModel with ChangeNotifier {
  final NoteRepository repository;

  List<Note> _notes = [];
  UnmodifiableListView<Note> get note => UnmodifiableListView(_notes);

  Note? _recentDeletedNote;//삭제된 노트가 임시로 저장될 변수

  NotesViewModel(this.repository);

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
    );
  } //무조건 화면에 나오는 event는 onEvent를 통해서만 받을 예정이다

  Future<void> _loadNotes() async {
    List<Note> notes = await repository.getNote();
    _notes = notes;
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await repository.deleteNote(note);
    _recentDeletedNote = note;//임시로 저장된 노트를 불러오기

    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if(_recentDeletedNote != null) {
      await repository.insertNote(_recentDeletedNote!);//임시저장된 노트를 추가시키자
      _recentDeletedNote = null;  //임시저장된 노트를 다시 비우자

      _loadNotes();
    }
  }
}
