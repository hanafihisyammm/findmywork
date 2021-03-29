part of 'note_form_bloc.dart';

@freezed
class NoteFormEvent with _$NoteFormEvent {
  const factory NoteFormEvent.initialized(Option<Note> initialNoteOption) =
      _Initialized;
  const factory NoteFormEvent.bodyChanged(String bodyString) = _BodyChanged;
  const factory NoteFormEvent.colorChanged(Color colorString) = _ColorChanged;
  const factory NoteFormEvent.todosChanged(
      KtList<TodoItemPrimitive> todoKtList) = _TodosChanged;
  const factory NoteFormEvent.saved() = _Saved;
}
