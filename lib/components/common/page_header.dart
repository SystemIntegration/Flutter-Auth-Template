import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Container(
      width: double.infinity,
      height: size.height * 0.2,
      color: Colors.white,
      child: Image.asset('assets/images/silogo.jpeg',height: 10,),
    ));
  }
}
