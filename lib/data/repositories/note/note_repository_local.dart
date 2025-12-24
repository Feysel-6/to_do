import 'package:flutter_mapp/data/repositories/note/note_repository.dart';
import 'package:flutter_mapp/data/services/local/local_data_service.dart';
import 'package:flutter_mapp/domain/models/note.dart';
import 'package:flutter_mapp/utlis/result.dart';

class NoteRepositoryLocal implements NoteRepository{
  NoteRepositoryLocal({required LocalDataService localDataService}) : _localDataService = localDataService;

  final LocalDataService _localDataService;

  @override
  Future<Result<List<Note>>> getNote() async{
    try{
      final notes =  await _localDataService.getNotes();
      return Result.ok(notes);
    } catch(e){
      return Result.error(Exception(e.toString()));
    }

  }
}