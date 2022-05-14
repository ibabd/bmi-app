import 'package:bmi_flutter_app/screen/screen1.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Screen1()),);
        },
        child: Container(
          color: Colors.black,
          child: Hero(
            tag: "go",
            child: Image(
              image: AssetImage("images/3.jpg"),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}
