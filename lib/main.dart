import 'package:daryo_ui/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: "Material App",
     theme: ThemeData(primarySwatch: Colors.blue),
     debugShowCheckedModeBanner: false,
     home: HomePage(),
   );
  }

}