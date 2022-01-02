import 'package:flutter/material.dart';
import 'package:flutter_prototype/Ui/reportstatus.dart';
import 'package:kommunicate_flutter/kommunicate_flutter.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
     appBar: AppBar(
  automaticallyImplyLeading:false,
  leading: Icon(Icons.sort),
  title: Text('Home'),
  centerTitle: true,
  actions: [
    
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Icon(Icons.notifications),
    )
    
  ],
  backgroundColor: Colors.blue,
),
      body:
       ListView(
        children: [
          SizedBox(height: 10),
          Padding(padding: EdgeInsetsDirectional.fromSTEB(12, 8, 0, 4),
          child:Text("Recent Report",style:TextStyle(fontSize: 24,fontWeight:FontWeight.w400),) ),
          
          Card(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.report,size: 32),
                  title: const Text('#12345'),
                  subtitle: Text(
                    '31 December 2021, 4.29 PM',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Several potholes in the rightside of the road. Please fix it as soon as possible.',
                    
                    style: TextStyle(color: Colors.black.withOpacity(0.8)),
                  ),
                ),
                
                Image.asset('assets/images/pothole.jpg'),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>ReportStatus()),
                      );
                      },
                      child: const Text('Track Status'),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
          
          Card(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.report,size: 32,),
                  title: const Text('#12349'),
                  subtitle: Text(
                    '1 January 2022, 1.43 PM',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Several potholes in the rightside of the road. Please fix it as soon as possible.',
                    style: TextStyle(color: Colors.black.withOpacity(0.8)),
                  ),
                ),
               
                Image.asset('assets/images/pothole.jpg'),
                 ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>ReportStatus()),
                      );
                      },
                      child: const Text('Track Status'),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),

          Card(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.report,size: 32,),
                  title: const Text('#12366'),
                  subtitle: Text(
                    '1 January 2022, 8.34 PM',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Several potholes in the rightside of the road. Please fix it as soon as possible.',
                    style: TextStyle(color: Colors.black.withOpacity(0.8)),
                  ),
                ),
               
                Image.asset('assets/images/pothole.jpg'),
                 ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>ReportStatus()),
                      );
                      },
                      child: const Text('Track Status'),
                    ),
                    
                  ],
                ),
              ],
            ),
          ),
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