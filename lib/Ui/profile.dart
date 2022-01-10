import 'package:flutter/material.dart';
import 'package:flutter_prototype/Ui/account_verify.dart';
import 'package:flutter_prototype/Ui/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_prototype/Component/profile_menu.dart';
import 'package:flutter_prototype/Ui/setting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
const String _url='https://www.kkr.gov.my/ms/Soalan-Lazim-KKR';

_signOut() async {
  await _firebaseAuth.signOut();
}

void _launchURL() async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 45),
      child: Column(
        children: [
          SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/profileimage.png"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/verified.svg"),
              ),
            ),
          )
        ],
      ),
    ),
    Padding(
  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
  child: Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Abu Bakar",       
        style: TextStyle(fontSize: 20),
      ),
      
    ],
  ),
),
Padding(
  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
  child: Text(
    "abc@gmail.com",
    style: TextStyle(fontSize: 20
    ,fontWeight: FontWeight.bold),
      
    ),
  ),

          SizedBox(height: 20), 
          ProfileMenu(
            text: "Account Verification",
            icon: "assets/icons/verified.svg",
            press: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AccountVerify()));
            },
          ), 
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingScreen()));
            },
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {
              _launchURL();
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () async {
                    await _signOut();
                    if (_firebaseAuth.currentUser == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    }
            }
          ),
        ],
      ),
    )
    );
  }
}