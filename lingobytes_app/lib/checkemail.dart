import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class CheckEmail extends StatefulWidget {
  @override
  _CheckEmailState createState() => _CheckEmailState();
}

class _CheckEmailState extends State<CheckEmail> {
  String text_val = "Waiting for email confirmation (Check your inbox)";
  int currentIndex = 0;
  Timer? timer;

  final List<String> textVariations = [
    "Waiting for email confirmation (Check your inbox)",
    "Waiting for email confirmation (Check your inbox).",
    "Waiting for email confirmation (Check your inbox)..",
    "Waiting for email confirmation (Check your inbox)...",
  ];
  bool _needsRebuild = true;




  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _needsRebuild = !_needsRebuild;
        currentIndex = (currentIndex + 1) % textVariations.length;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Center(
              child: Text(
                textVariations[currentIndex],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                child: Text("Check"),
                onPressed: () async {
                  final user = FirebaseAuth.instance.currentUser;
                  if (user != null && user.emailVerified) {
                    Navigator.pushNamed(context, '/main');
                  } else {
                    setState(() {
                      text_val = "Not verified";
                    });
                  }
                }),
          ],
        ),
      ),
    );
  }
}
