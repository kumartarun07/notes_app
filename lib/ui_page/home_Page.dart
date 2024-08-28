import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/db_helper/dbhelper.dart';
import 'package:notes_app/ui_page/add_notes.dart';

class HomePage extends StatefulWidget
{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  ///Controller..
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  DbHelper myDb = DbHelper.getInstance();
  List<Map<String,dynamic>>allNotes =[];
  @override
  void initState() {
    super.initState();
    getnotes();
  }
  getnotes()
  async{
    allNotes = await myDb.fetchAllNotes();
   setState(() {

   });
  }
  @override
  Widget build(BuildContext context)
  {

   return Scaffold(backgroundColor:Color(0xff252525) ,
     appBar: AppBar(backgroundColor: Color(0xff252525),
     title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
       Text("Notes",style: TextStyle(color: Colors.white),),
       Container(
         height: 50,width: 50,
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xff3B3B3B)),
         child: IconButton(onPressed: (){},icon: Icon(Icons.search,size: 25,color:Colors.white,),),
       )
     ],),
     ),
       ///body start..
       body: allNotes.isNotEmpty?Stack(
         children: [
           GridView.builder(itemCount: allNotes.length,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 //mainAxisExtent: 9/16,
                 crossAxisSpacing: 15,
                 mainAxisSpacing: 5,
                 mainAxisExtent: 200,

               ),
               itemBuilder: (_,index){
             return Container(
               margin: EdgeInsets.only(top: 10),
               width: 200,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                   color: Colors.primaries[Random().nextInt(Colors.primaries.length-1)]),
               child: InkWell(onTap: (){
                 titlecontroller.text = allNotes[index][DbHelper.COLUMN_NOTE_TITLE];
                 desccontroller.text = allNotes[index][DbHelper.COLUMN_NOTE_DESC];
               Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNotes(next: myscaf(isUpdate: true,sno:allNotes[index][DbHelper.COLUMN_NOTE_SNO] ))),);

               },
                 child: Stack(alignment: Alignment.topRight,
                   children: [
                     Container(width: 150,margin: EdgeInsets.all(50),
                       child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Text( allNotes[index][DbHelper.COLUMN_NOTE_TITLE]),
                         ],
                       ),
                     ),
                     IconButton(onPressed: ()
                    async {
                       bool check = await myDb.deleteNotes(sno:allNotes[index][DbHelper.COLUMN_NOTE_SNO]);
                       if(check)
                         {
                           getnotes();
                         }
                     }, icon: Icon(Icons.dangerous,size: 30,color: Colors.white,)),
                   ],
                 ),
               ),
             );
               }),
         ]

       )
           :Center(child: Text("No Notes Found!!"),

       ),

       floatingActionButton: FloatingActionButton(onPressed: (){
         titlecontroller.clear();
         desccontroller.clear();
         Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNotes(next: myscaf())));

       },
         backgroundColor: Colors.black,elevation: 11,
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
         child: Icon(Icons.add,size: 30,color: Colors.white,),),

   );
  }

  Widget myscaf({isUpdate = false,int sno =0})
  {
    return   Scaffold(backgroundColor: Color(0xff252525),
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
            child:isUpdate ?
            Container(width: 50,height: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xff3E3E3E)),
              child: IconButton(onPressed: (){
                if(titlecontroller.text.isNotEmpty && desccontroller.text.isNotEmpty)
                {
                  myDb.updateNote(mtitle: titlecontroller.text, mdesc: desccontroller.text, sno: sno);
                  Navigator.pop(context);
                }
              },icon: Icon(Icons.edit,color: Colors.white,size: 25,)),
            ):
            Container(height: 50,width: 120,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xff3B3B3B)),
              child:TextButton(onPressed: ()
              async{
                if(titlecontroller.text.isNotEmpty && desccontroller.text.isNotEmpty)
                {
                  await myDb.addNote(title: titlecontroller.text, desc: desccontroller.text);
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
}






























/*
class HomePage extends StatefulWidget
{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  DbHelper myDb = DbHelper.getInstance();

  @override
  void initState() {
    super.initState();
    getnotes();
  }
  getnotes()
  async{
    AddNotes.allNotes = await myDb.fetchAllNotes();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context)
  {

    return Scaffold(backgroundColor:Color(0xff252525) ,
      appBar: AppBar(backgroundColor: Color(0xff252525),
        title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Notes",style: TextStyle(color: Colors.white),),
            Container(
              height: 50,width: 50,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xff3B3B3B)),
              child: IconButton(onPressed: (){},icon: Icon(Icons.search,size: 25,color:Colors.white,),),
            )
          ],),
      ),
      body: AddNotes.allNotes.isNotEmpty?Stack(
          children: [
            GridView.builder(itemCount:  AddNotes.allNotes.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  //mainAxisExtent: 9/16,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 5,
                  mainAxisExtent: 200,

                ),
                itemBuilder: (_,index){
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 200,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                        color: Colors.primaries[Random().nextInt(Colors.primaries.length-1)]),
                    child: InkWell(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNotes()),
                      );
                    },
                      child: Stack(alignment: Alignment.topRight,
                        children: [
                          Container(width: 150,margin: EdgeInsets.all(50),
                            child: Column(mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text( AddNotes.allNotes[index][DbHelper.COLUMN_NOTE_TITLE]),
                              ],
                            ),
                          ),
                          IconButton(onPressed: ()
                          async {
                            bool check = await myDb.deleteNotes(sno: AddNotes.allNotes[index][DbHelper.COLUMN_NOTE_SNO]);
                            if(check)
                            {
                              getnotes();
                            }
                          }, icon: Icon(Icons.dangerous,size: 30,color: Colors.white,)),
                        ],
                      ),
                    ),
                  );
                }),
          ]

      )
          :Center(child: Text("No Notes Found!!"),

      ),

      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNotes()));
      },
        backgroundColor: Colors.black,elevation: 11,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(Icons.add,size: 30,color: Colors.white,),),

    );
  }
}*/
