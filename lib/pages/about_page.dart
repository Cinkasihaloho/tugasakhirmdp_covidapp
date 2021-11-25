import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.coronavirus,
              size: 100,
              color: Colors.red,
            ),
            Text(
              "Covid App",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text("v1.0.0"),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Card(
                color: Colors.indigo[200],
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                      "This app for you to know how many person get diseased by Corona Virus in several countries. To help you beware and to be reminder to keep your body healthy and safe. Stay Safe everyone!"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
