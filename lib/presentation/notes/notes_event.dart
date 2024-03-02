import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/note.dart';

part 'notes_event.freezed.dart';

@freezed//봉인클래스(sealed Class)의 장점은 데이터를 받을 수 있다
abstract class NotesEvent<T> with _$NotesEvent {
  const factory NotesEvent.loadNotes() = LoadNotes;

  const factory NotesEvent.deleteNote(Note note) = DeleteNote;

  const factory NotesEvent.restoreNote() = restoreNote;
}
 //이걸만드는 이유? 인간이 놓칠 수 있는 것들은 안놓치기 위해서
