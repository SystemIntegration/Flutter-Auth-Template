import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dialogs {

  // static Future<void> showLoadingDialog(
  //     BuildContext context) async {
  //   return showDialog<void>(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (BuildContext context) {
  //         return new WillPopScope(
  //             onWillPop: () async => false,
  //             child: SimpleDialog(
  //                 backgroundColor: Colors.black54,
  //                 children: <Widget>[
  //                   Center(
  //                     child: Column(children: [
  //                       CircularProgressIndicator(),
  //                       SizedBox(height: 10,),
  //                       Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
  //                     ]),
  //                   )
  //                 ]));
  //       });
  // }



static showLoadingDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}