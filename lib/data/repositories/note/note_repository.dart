import '../../../domain/models/note.dart';
import '../../../utlis/result.dart';

abstract class NoteRepository {
  Future<Result<List<Note>>> getNote();
}