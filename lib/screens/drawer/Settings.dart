import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isDarkModeEnabled = false;
  String _selectedLanguage = 'English';
  bool _saveLoginInfo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade600, Colors.blue.shade400, Colors.blue.shade200],
            ),
          ),
        ),
        title: Text("Settings", style: TextStyle(fontFamily: "cairo")),
      ),
      body: Container(
        color: Colors.blue.shade50,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _buildSettingOption(
                title: 'Enable Dark Mode',
                trailing: Switch(
                  value: _isDarkModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isDarkModeEnabled = value;
                      // Implement theme change logic here
                    });
                  },
                  activeTrackColor: Colors.blue.shade200,
                  activeColor: Colors.blue,
                ),
              ),
              _buildSettingOption(
                title: 'Language',
                trailing: DropdownButton<String>(
                  value: _selectedLanguage,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedLanguage = newValue!;
                      // Implement language change logic here
                    });
                  },
                  items: ['English', 'Arabic'] // Add your supported languages here
                      .map<DropdownMenuItem<String>>(
                        (value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ),
                  )
                      .toList(),
                ),
              ),
              _buildSettingOption(
                title: 'Save Login Info',
                trailing: Switch(
                  value: _saveLoginInfo,
                  onChanged: (value) {
                    setState(() {
                      _saveLoginInfo = value;
                    });
                  },
                  activeTrackColor: Colors.blue.shade200,
                  activeColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingOption({required String title, required Widget trailing}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: trailing,
      ),
    );
  }
}
