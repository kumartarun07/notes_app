import 'package:flutter/material.dart';
import 'package:notes_app/ui_page/home_Page.dart';
class AddNotes extends StatefulWidget
{
  var next;
  AddNotes({required this.next});
  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  @override
  Widget build(BuildContext context) {
    return widget.next;

  }
}











/*
class AddNotes extends StatefulWidget
{
  static List<Map<String,dynamic>>allNotes =[];
  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  DbHelper myDB = DbHelper.getInstance();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Color(0xff252525),
      appBar: AppBar(backgroundColor: Color(0xff252525),
        leadingWidth: 70,
        toolbarHeight: 50,
        leading:  Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(height: 50,width: 50,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xff3B3B3B)),
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            },icon: Icon(Icons.arrow_back_ios_new,size: 25,color: Colors.white,),),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(height: 50,width: 120,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xff3B3B3B)),
              child:TextButton(onPressed: ()
              async{
                if(titlecontroller.text.isNotEmpty && desccontroller.text.isNotEmpty)
                {
                  await myDB.addNote(title: titlecontroller.text, desc: desccontroller.text);
                  Navigator.pop(context);
                }
              },child: Text("Save",style: TextStyle(fontSize: 20,color: Colors.white),),),
            ),
          )
        ],
      ),

      body:
      Container(margin: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: [
            TextField(controller: titlecontroller,decoration: InputDecoration(
              hintText: "Title",hintStyle: TextStyle(fontSize: 30,color: Colors.grey.shade500),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
            ),style: TextStyle(fontSize: 30,color: Colors.white),maxLines: null,),
            TextField(controller: desccontroller,decoration: InputDecoration(
              hintText: "Type Something....",hintStyle: TextStyle(fontSize: 20,color: Colors.white),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: EdgeInsets.all(10),
            ),
              style: TextStyle(fontSize: 20,color: Colors.white),maxLines: null,
            ),
          ],
        ),
      ),
    );
  }

}*/
