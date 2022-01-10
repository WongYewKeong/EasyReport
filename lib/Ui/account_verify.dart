import 'package:flutter/material.dart';
import 'package:badges/badges.dart';

class AccountVerify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account Verification')),
      body:ListView(
        
        children:[
        Card(
        color: Colors.deepPurple[50],
        margin: EdgeInsets.fromLTRB(16, 20, 16, 16),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      
      children: <Widget>[
        const ListTile(  
          leading: Icon(Icons.how_to_reg, size: 64,color: Colors.lightBlue,),
          title: Text('Abu Bakar'),
          subtitle: Text('MyKad:9**********8'), 
        ),
        
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(96, 0, 0, 10),
            child: Badge(  
      padding: EdgeInsets.fromLTRB(12, 6, 12, 6),  
      toAnimate: false,
      shape: BadgeShape.square,
      badgeColor: Colors.blue.shade700,
      borderRadius: BorderRadius.circular(8),
      badgeContent: Text('Verified', style: TextStyle(color: Colors.white)),
    ),
          ),
          
        ],)  
      ],
    ),
  ),
ListTile(
  contentPadding: EdgeInsets.fromLTRB(16, 4, 4, 8),
  title: Text('Faster Review Process'),
      leading: Icon(Icons.bolt,size: 48,color:Colors.yellow,),
),
ListTile(
  contentPadding: EdgeInsets.fromLTRB(16, 4, 4, 8),
  title: Text('Prevent Fraud Report'),
      leading: Icon(Icons.highlight_off, size: 48,color: Colors.red,),
),
      ],
      
      ),
    );
  }
}