//@dart=2.9
import 'package:camera/camera.dart';
import 'package:clone_whatsapp/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:clone_whatsapp/screens/camera_screen.dart';
import 'package:clone_whatsapp/screens/home.dart';
Future<void> main()async{
  WidgetsFlutterBinding.ensureInitialized();
  cam=await availableCameras();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({ Key key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData(
       //fontFamily: "OpenSans",
primaryColor: Color(0xFF075E54),
 accentColor: Color(0xFF128C7E)
      ),
home: login(),
    );
  }
}