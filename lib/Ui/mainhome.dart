import 'package:flutter/material.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text("Home Page",style: TextStyle(fontSize: 20),))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async{
          try {
            dynamic conversationObject = {
     'appId': '3e99e9ca11adde7870b721f2264ac8edc',// The [APP_ID](https://dashboard.kommunicate.io/settings/install) obtained from kommunicate dashboard.
     };

    dynamic result= await KommunicateFlutterPlugin.buildConversation(conversationObject);
        
      print("Conversation builder success : " + result.toString());
    }on Exception catch (e) {
      print("Conversation builder error : " + e.toString());
    }
        },
          
          
        
        backgroundColor: Colors.red[300],
        tooltip: 'Chatbot',
        label: Text("Chat"),
        icon: const Icon(Icons.smart_toy_outlined,
        
      ),
      ),
    );
  }
}