import 'package:notes_app/db_helper/dbhelper.dart';

class NoteModel
{
  int? sno;
  String title;
  String desc;

  NoteModel({this.sno,required this.title,required this.desc});

  /// from map to model
   factory NoteModel.frommap(Map<String,dynamic>map) => NoteModel(
         title: map[DbHelper.COLUMN_NOTE_TITLE],
         desc:map[DbHelper.COLUMN_NOTE_DESC],
        sno: map[DbHelper.COLUMN_NOTE_SNO]
   );

   /// from model to map
    Map<String,dynamic>toMap() =>{
      DbHelper.COLUMN_NOTE_TITLE:title,
      DbHelper.COLUMN_NOTE_DESC:desc
    };
}