import 'package:flutter/material.dart';
import 'package:lingobytes_app/startpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:lingobytes_app/login.dart';
import 'package:lingobytes_app/signup.dart';
import 'package:lingobytes_app/checkemail.dart';
import 'package:lingobytes_app/mainscreen.dart';


// void main() {
//   runApp(Main()); // Wrap with MaterialApp
// }
//
// class Main extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         scaffoldBackgroundColor: Color(0xffECFDF5),
//         textTheme: TextTheme(
//           bodyText1: TextStyle(color: Color(0xff064E3B)),
//         ),
//       ),
//       home: StartPage(),
//       routes: {
//         '/': (context) => Main(),
//         '/details': (context) => DetailScreen(),
//       },
//     );
//   }
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffECFDF5),
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Color(0xff064E3B)),
          ),
        ),
        home: StartPage(),
        routes: {
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
          '/home': (context) => StartPage(),
          '/checkemail': (context) => CheckEmail(),
          '/main': (context) => Mainscreen(),
        },
      )
  );
}
