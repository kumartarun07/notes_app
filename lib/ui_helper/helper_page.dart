import 'package:flutter/material.dart';

class WidgetPage extends StatelessWidget
{
  var micon;
  var mcolor;
  WidgetPage({this.micon,this.mcolor});
  @override
  Widget build(BuildContext context)
  {
   return Container(
     height: 50,width: 50,
     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xff3B3B3B)),
     child: IconButton(onPressed: (){},icon: micon(Icons,size: 15,color:mcolor,),),
   );
  }
}

