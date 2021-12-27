import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_prototype/Ui/mainhome.dart';
import 'package:flutter_prototype/Ui/report.dart';
import 'package:flutter_prototype/Ui/profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  int selectedPage=0;
  final _pageOptions=[Home(),Report(),Profile()];
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
      appBar: AppBar(title: const Text('Home'),automaticallyImplyLeading: false,
        backgroundColor: Colors.blue),
      body: _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.blue,
        items: [
          TabItem(icon: Icons.home,title:'Home'),
          TabItem(icon: Icons.add),
          TabItem(icon: Icons.people,title:'Profile'),
        ],
       
       initialActiveIndex: 0,
       onTap: (int i){
         setState(() {
           selectedPage=i;
         });
       },
      ),
    )
    );
  }
}
