import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/lingobytes-icon.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 50),
            Text(
              'Learn English in Engaging Stories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Login'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xffECFDF5)),
                  foregroundColor: MaterialStateProperty.all(Color(0xff044F3B)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                )
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
            height: 50,
            width: 200,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Sign Up'),
              style: ButtonStyle(
                side: MaterialStateProperty.all(BorderSide(color: Color(0xff064E3B))),
                foregroundColor: MaterialStateProperty.all(Color(0xff064E3B)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
