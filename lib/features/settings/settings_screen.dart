import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/common/widgets/main_navigation/video_config/video_config.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: Locale("es"),
      child: Scaffold(
        appBar: AppBar(title: Text('Settings')),
        body: ListView(
          children: [
            ValueListenableBuilder(
              valueListenable: videoConfig,
              builder: (context, value, child) => SwitchListTile.adaptive(
                value: value,
                onChanged: (value) {
                  videoConfig.value = !videoConfig.value;
                },
                title: Text("Mute video"),
                subtitle: Text("Videos will be muted by default."),
              ),
            ),
            //           AnimatedBuilder(
            //   animation: videoConfig,
            //   builder: (context, child) => SwitchListTile.adaptive(
            //     value: videoConfig.value,
            //     onChanged: (value) {
            //       videoConfig.value = !videoConfig.value;
            //     },
            //     title: Text("Mute video"),
            //     subtitle: Text("Videos will be muted by default."),
            //   ),
            // ),
            CheckboxListTile(
              activeColor: Colors.black,
              value: _notifications,
              onChanged: _onNotificationChanged,
              title: Text("Enable notifications"),
            ),
            ListTile(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2030),
                );
                if (kDebugMode) {
                  print(date);
                }

                if (!mounted) return;
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (kDebugMode) {
                  print(time);
                }
                if (!mounted) return;
                final booking = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(1980),
                  lastDate: DateTime(2030),

                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: Colors.amberAccent,
                          onPrimary: Colors.redAccent,
                          onSurface: Colors.blueAccent,
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (kDebugMode) {
                  print(booking);
                }
              },
              title: Text("What is your birthday?"),
              subtitle: Text("I need to know!"),
            ),
            ListTile(
              title: Text("Log out (iOS)"),
              textColor: Colors.red,
              onTap: () {
                // showCupertinoDialog(
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: Text("Are you sure?"),
                    content: Text("Plx dont go"),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("No"),
                      ),
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed: () => Navigator.of(context).pop(),
                        // 글씨 색이 붉지 않아서 넣어봄
                        // textStyle: TextStyle(color: Colors.red),
                        child: Text("Yes"),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Log out (Android)"),
              textColor: Colors.red,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    icon: FaIcon(FontAwesomeIcons.skull),
                    title: Text("Are you sure?"),
                    content: Text("Plx dont go"),
                    actions: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: FaIcon(FontAwesomeIcons.car),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("Yes"),
                      ),
                    ],
                  ),
                );
              },
            ),

            ListTile(
              title: Text("Log out (iOS / Bottom)"),
              textColor: Colors.red,
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    title: Text("Are you sure?"),
                    message: Text("Please doooooooont gooooo"),
                    actions: [
                      CupertinoActionSheetAction(
                        isDefaultAction: true,
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("Not log out"),
                      ),
                      CupertinoActionSheetAction(
                        isDefaultAction: true,
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("Yes plz."),
                      ),
                    ],
                  ),
                );
              },
            ),

            AboutListTile(
              applicationVersion: "1.0",
              applicationLegalese: "Don't copy me.",
            ),
          ],
        ),
      ),
    );
  }
}
