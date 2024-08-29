import 'package:flutter/material.dart';
import 'package:notes_app/db_helper/dbhelper.dart';

import 'note_model.dart';

class DbProvider extends ChangeNotifier
{
  DbHelper dbHelper;
  DbProvider({required this.dbHelper});
  List<NoteModel>_mNotes=[];
  /// add event
  void addnotes(NoteModel newnote)
  async{
  bool check  = await dbHelper.addNote(newnote: newnote);
  if(check)
    {
      _mNotes =await dbHelper.fetchAllNotes();
      notifyListeners();
    }
  }

  void updatenote(NoteModel updated,int sno)
  async{
    bool check = await dbHelper.updateNote(update: updated, sno: sno);
    if(check)
      {
        _mNotes = await dbHelper.fetchAllNotes();
        notifyListeners();
      }
  }

  void deletenote(int sno)
  async{
    bool check = await dbHelper.deleteNotes(sno: sno);
    if(check)
      {
        _mNotes = await dbHelper.fetchAllNotes();
        notifyListeners();
      }
  }

  void getInicialNote()
  async{
    _mNotes = await dbHelper.fetchAllNotes();
    notifyListeners();
  }

  List <NoteModel>getnotes() => _mNotes;

}