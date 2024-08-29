import 'package:flutter/material.dart';
import 'package:notes_app/db_helper/db_provider.dart';
import 'package:notes_app/db_helper/dbhelper.dart';
import 'package:notes_app/ui_page/home_Page.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    ChangeNotifierProvider(create: (context)=> DbProvider(dbHelper: DbHelper.getInstance()),
    child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: HomePage(),
     debugShowCheckedModeBanner: false,
   );
  }
}
