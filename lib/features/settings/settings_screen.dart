import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Column(
        children: [
          // CupertinoActivityIndicator(
          //   radius: 40,
          //   // animating: false, // 움직이지 않음
          // ),
          // CircularProgressIndicator(),
          CircularProgressIndicator.adaptive(),
        ],
      ),

      // body: ListWheelScrollView(
      //   // useMagnifier: true,
      //   // magnification: 1.5, // 돋보기 같음
      //   diameterRatio: 1, // 100일때 곡률이 보이지않음
      //   offAxisFraction: 2, // 원통이 살짝 옆으로 돌아감
      //   itemExtent: 200,
      //   children: [
      //     for (var x in [1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1])
      //       FractionallySizedBox(
      //         widthFactor: 1,
      //         child: Container(
      //           color: Colors.teal,
      //           alignment: Alignment.center,
      //           child: Text(
      //             'Pick me',
      //             style: TextStyle(color: Colors.white, fontSize: 39),
      //           ),
      //         ),
      //       ),
      //   ],
      // ),
    );
  }
}
