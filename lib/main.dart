import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/inbox/activity_screen.dart';
import 'package:tiktok_clone/features/main_navigation/main_navigation_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark, //light dark
  );

  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TikTok Clone',
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xFFE9435A),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
          // selectionColor: Color(0xFFE9435A),
        ),
        splashColor: Colors.transparent,
        // highlightColor: Colors.transparent,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      // home: SignUpScreen(),
      // home: ActivityScreen(),
      home: MainNavigationScreen(),
      // home: LayoutBuilderCodeLab(),
    );
  }
}

// // class LayoutBuilderCodeLab extends StatelessWidget {
// //   const LayoutBuilderCodeLab({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final size = MediaQuery.of(context).size;

// //     return Scaffold(
// //       body: LayoutBuilder(
// //         builder: (context, constraints) => Container(
// //           // width: size.width,
// //           // height: size.height,
// //           width: constraints.maxWidth,
// //           height: constraints.maxHeight,
// //           color: Colors.teal,
// //           child: Center(
// //             child: Text(
// //               "${size.width} / ${constraints.maxWidth}", // 같음
// //               style: TextStyle(color: Colors.white, fontSize: 98),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// class LayoutBuilderCodeLab extends StatelessWidget {
//   const LayoutBuilderCodeLab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: SizedBox(
//         width: size.width / 2, // 화면의 너비의 반만큼 차지
//         child: LayoutBuilder(
//           builder: (context, constraints) => Container(
//             // width: size.width,
//             // height: size.height,
//             width: constraints.maxWidth,
//             height: constraints.maxHeight,
//             color: Colors.teal,
//             child: Center(
//               child: Text(
//                 "${size.width} / ${constraints.maxWidth}",
//                 style: TextStyle(color: Colors.white, fontSize: 98),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
