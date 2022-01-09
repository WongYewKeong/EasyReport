import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';


class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}



class _SettingScreenState extends State<SettingScreen> {
bool notificationsEnabled = true;
bool changePass = true;
bool useFingerprint = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: buildSettingsList()
    );
  }


Widget buildSettingsList() {
    return SettingsList(
      
        sections: [
          SettingsSection(
            titlePadding: EdgeInsets.fromLTRB(16, 16, 0, 4),
            title: 'General',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onTap: () {
                  
                },
              ),
              SettingsTile(
                  title: 'Preferences',
                  leading: Icon(Icons.settings)),
            ],
          ),
          SettingsSection(
            titlePadding: EdgeInsets.fromLTRB(16, 16, 0, 4),
            title: 'Account',
            tiles: [
              SettingsTile(title: '+60 1135462732', leading: Icon(Icons.phone)),
              SettingsTile(title: 'abc@gmail.com', leading: Icon(Icons.email)),
            ],  
          ),
          SettingsSection(
            titlePadding: EdgeInsets.fromLTRB(16, 16, 0, 4),
            title: 'Security',
            tiles: [
              SettingsTile.switchTile(
                  title: 'Use fingerprint',
                  leading: Icon(Icons.fingerprint),
                  switchValue: useFingerprint,
                  onToggle: (bool value) {
                    setState(() {
                      useFingerprint=value;
                    });
                  },
                  ),
              SettingsTile.switchTile(
                title: 'Change password',
                leading: Icon(Icons.lock),
                switchValue: changePass,
                onToggle: (bool value) {
                  setState(() {
                    changePass=value;
                  });
                },
              ),
              SettingsTile.switchTile(
              title: 'Enable Notifications',
              leading: Icon(Icons.notifications_active),
              switchValue: notificationsEnabled,
              onToggle: (bool value) {
                setState(() {
                  notificationsEnabled=value;
                });
              },
            ),
            ],
          ),
          SettingsSection(
            titlePadding: EdgeInsets.fromLTRB(16, 16, 0, 4),
            title: 'More Options',
            tiles: [
              SettingsTile(
                  title: 'Terms of Service', leading: Icon(Icons.description)),
              SettingsTile(
                  title: 'Privacy Policy',
                  leading: Icon(Icons.policy)),
            ],
          )
        ],
      );
    
  }
}
