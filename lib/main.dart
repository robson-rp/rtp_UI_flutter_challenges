import 'package:flutter/material.dart';
import 'pages/login_pages/login1.dart';

void main() {

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ui Challenges by Robson Rtp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login1(),
    );
  }
}
