import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_register_demo/components/login_page.dart';

class HomeScreen extends StatefulWidget {
  //String name;
  //HomeScreen({Key? key,required this.name}) : super(key: key);
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textFieldValueHolder = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    //Navigator.pop(context);
                       MaterialPageRoute(builder: (context) => LoginPage());
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              // Padding(
              //     padding: EdgeInsets.all(8.0),
              //     child: Text('Hello :${widget.name}',
              //         style: TextStyle(fontSize: 20)))

              Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                      Text('Hi ${user.email}', style: TextStyle(fontSize: 20)))
            ],
          ),
        ));
  }
}
