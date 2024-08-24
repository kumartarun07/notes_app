import 'package:flutter/material.dart';
import 'package:notes_app/ui_page/home_Page.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: HomePage(),
     debugShowCheckedModeBanner: false,
   );
  }
}
