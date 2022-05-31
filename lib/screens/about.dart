import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_test/screens/home.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Seconde page"),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () => {
                      //     Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),))
                    },
                child: Text("To Home Page"))
          ],
        ),
      );
}
