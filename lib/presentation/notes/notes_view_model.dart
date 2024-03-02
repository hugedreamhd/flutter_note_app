import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_note_app/domain/repository/note_repository.dart';
import 'package:flutter_note_app/presentation/notes/notes_event.dart';
import 'package:flutter_note_app/presentation/notes/notes_state.dart';

import '../../domain/model/note.dart';

class NotesViewModel with ChangeNotifier {
  final NoteRepository repository;

  NotesState _state = NotesState(notes: []);

  // notes_state.dart 내 @Default([]) List<Note> notes 로 기본값을 준다면
  // -> NotesState _state = NotesState();
  NotesState get state => _state;

  List<Note> _notes = [];

  UnmodifiableListView<Note> get note => UnmodifiableListView(_notes);

  Note? _recentDeletedNote; //삭제된 노트가 임시로 저장될 변수

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
    _state = state.copyWith(
      notes: notes,
    );
    //_notes = notes; state로 접근하기 전 방식?
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await repository.deleteNote(note);
    _recentDeletedNote = note; //임시로 저장된 노트를 불러오기

    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if (_recentDeletedNote != null) {
      await repository.insertNote(_recentDeletedNote!); //임시저장된 노트를 추가시키자
      _recentDeletedNote = null; //임시저장된 노트를 다시 비우자

      _loadNotes();
    }
  }
}
