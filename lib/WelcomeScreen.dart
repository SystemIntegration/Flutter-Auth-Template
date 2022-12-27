import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Second Page",
          style: TextStyle(color: Colors.white),
        ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
      ),
     
      body: Center(
        child: Text('Welcome!', style: Theme.of(context).textTheme.headline2),
      ),
    );
  }
}
