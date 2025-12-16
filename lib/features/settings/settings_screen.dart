import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          // CupertinoSwitch(
          //   value: _notifications,
          //   onChanged: _onNotificationChanged,
          // ),
          // Switch.adaptive(
          //   // 시뮬레이터에 따라 스타일 변경됨
          //   value: _notifications,
          //   onChanged: _onNotificationChanged,
          // ),

          // Switch(value: _notifications, onChanged: _onNotificationChanged),
          // SwitchListTile(
          SwitchListTile.adaptive(
            value: _notifications,
            onChanged: _onNotificationChanged,
            title: Text("Enable notifications"),
            subtitle: Text("Enable notifications"),
          ),

          // Checkbox(value: _notifications, onChanged: _onNotificationChanged),
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
              print(date);

              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              print(time);
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
              print(booking);
            },
            title: Text("What is your birthday?"),
          ),
          AboutListTile(),
        ],
      ),
    );
  }
}
