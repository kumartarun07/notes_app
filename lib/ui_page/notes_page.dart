/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../db_helper/dbhelper.dart';

class NotesPage extends StatefulWidget
{

  String title,desc;
  int sno;
  NotesPage({required this.title,required this.desc,required this.sno});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage>
{
  DbHelper myDb = DbHelper.getInstance();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
@override
  void initState() {
  titlecontroller.text= widget.title;
  desccontroller.text = widget.desc;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Color(0xff252525),
     appBar: AppBar(
       leadingWidth: 70,
       toolbarHeight: 50,
       backgroundColor: Color(0xff252525),
       leading: Padding(
         padding: const EdgeInsets.only(left: 20,),
         child: Container(
           height: 50,
           width: 50,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xff3E3E3E)),
           child: IconButton(
             onPressed: (){
               Navigator.pop(context);
             },
             icon: Icon(CupertinoIcons.left_chevron,color: Colors.white),
           ),
         ),
       ),
       // leadingWidth: 0,
       actions: [
         Padding(
           padding: const EdgeInsets.only(right: 20,),
           child: Container(
           height: 50,
           width: 50,
           decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xff3E3E3E)),
             child: IconButton(onPressed: (){
               if (titlecontroller.text.isNotEmpty && desccontroller.text.isNotEmpty)
                 {
                   myDb.updateNote(mtitle: titlecontroller.text, mdesc: desccontroller.text, sno:widget.sno );
                 }
             },icon: Icon(Icons.edit,color: Colors.white,size: 25,),),
                  ),
         ),]
         ,),
     body: Container(margin: EdgeInsets.all(30),
       width: double.infinity,
       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
         children: [

           TextField(controller: titlecontroller,
              style: TextStyle(fontSize: 25,color: Colors.white),
             decoration: InputDecoration(
               enabledBorder: InputBorder.none,
               disabledBorder: InputBorder.none,
               focusedBorder: InputBorder.none,
             ),
                          ),
                          SizedBox(height: 20,),
           TextField(controller: desccontroller,
           style: TextStyle(fontSize: 20,color: Colors.white),
             decoration: InputDecoration(
               enabledBorder: InputBorder.none,
               disabledBorder: InputBorder.none,
               focusedBorder: InputBorder.none,
             ),
           )
         ],
       ),
     ),

   );
  }
}
*/
