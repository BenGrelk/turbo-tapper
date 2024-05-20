import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late Future<Map<String, dynamic>> settingsFuture;

  @override
  void initState() {
    super.initState();
    settingsFuture = loadSettings();
  }

  Future<Map<String, dynamic>> loadSettings() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/settings.json');
    if (await file.exists()) {
      return jsonDecode(await file.readAsString());
    } else {
      final defaultSettings = await rootBundle.loadString('assets/settings.json');
      return jsonDecode(defaultSettings);
    }
  }

  // applySettings writes settings to docDir/settings.json
  void applySettings() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/settings.json');
    await file.writeAsString(jsonEncode(await settingsFuture));

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: settingsFuture,
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            Map<String, dynamic>? settings = snapshot.data;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Sound subsection
                  Text(
                    'Sound',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Volume'),
                      Slider(
                        value: settings?['volume'] ?? 0.0,
                        onChanged: (double value) {
                          setState(() {
                            settings?['volume'] = value;
                          });
                        },
                        min: 0.0,
                        max: 1.0,
                        divisions: 10,
                      ),
                      // Label
                      Text(settings!['volume'].toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Music'),
                      Transform.scale(
                        scale: 0.5,
                        child: Switch(
                          value: settings['music'] ?? false,
                          onChanged: (bool value) {
                            setState(() {
                              settings['music'] = value;
                            });
                          },
                          activeTrackColor: Colors.greenAccent,
                          activeColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  // Mute switch
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Mute'),
                      Transform.scale(
                        scale: 0.5,
                        child: Switch(
                          value: settings['mute'] ?? false,
                          onChanged: (bool value) {
                            setState(() {
                              settings['mute'] = value;
                            });
                          },
                          activeTrackColor: Colors.redAccent,
                          activeColor: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  // Game subsection
                  Text(
                    'Game',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // taps_scale slider, float 0.0 to 5.0
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Taps scale'),
                      Slider(
                        value: settings['taps_scale'] ?? 0.0,
                        onChanged: (double value) {
                          setState(() {
                            settings['taps_scale'] = value;
                          });
                        },
                        min: 0.0,
                        max: 5.0,
                        divisions: 50,
                      ),
                      // Label (rounded to 2 decimal places)
                      Text(settings['taps_scale'].toStringAsFixed(2)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: applySettings,
                    child: Text('Save'),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
