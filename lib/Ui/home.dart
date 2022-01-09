import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_prototype/Ui/mainhome.dart';
import 'package:flutter_prototype/Ui/mymap.dart';
import 'package:flutter_prototype/Ui/profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  int selectedPage=0;
  final _pageOptions=[Home(),MapSample(),Profile()];
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async=>false,
      child: Scaffold(
      body: _pageOptions[selectedPage],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.lightBlue,
        items: [
          TabItem(icon: Icons.home,title:'Home'),
          TabItem(icon: Icons.add),
          TabItem(icon: Icons.person,title:'Profile'),
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
