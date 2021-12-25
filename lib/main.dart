// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
  
  
void main() => runApp(const MyApp());
  
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State createState() => _State();
}
  
class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) =>  const HelloConvexAppBar(),
      },
    );
  }
}
  
class HelloConvexAppBar extends StatelessWidget {
  const HelloConvexAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'),
        backgroundColor: Colors.blue),
      body: const Center( ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.blue,
        items: [
          TabItem(icon: Icons.home,title:'Home'),
          TabItem(icon: Icons.add),
          TabItem(icon: Icons.people,title:'Profilee'),
        ],
       
      ),
    );
  }
}