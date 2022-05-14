import 'package:flutter/material.dart';
import 'result.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  bool isMale = true;
  double h = 150;
  double wi = 80;

  Color b = Colors.black;
  Color w = Colors.white;
  Color l = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(
              color: w,
              icon: Icon(Icons.album_outlined),
              onPressed: (){
                setState(() {
                  if (b == Colors.black && w == Colors.white) {
                    b = Colors.white;
                    w = Colors.black;
                  } else {
                    b = Colors.black;
                    w = Colors.white;
                  }
                });
              },
            )
          ],
          centerTitle: true,
          flexibleSpace: Container(
            decoration:
            BoxDecoration(gradient: LinearGradient(colors: [b, l, b])),
          ),
          title: Text(
            "BMI",
            style: TextStyle(color: b, fontSize: 50),
          )),
      body: Container(
        color: b,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Hero(
                        tag: "go",
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isMale = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isMale ? l : b,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage("images/1.jpg"),
                                  height: 80,
                                  width: 80,
                                ),
                                Text(
                                  "male",
                                  style: TextStyle(color: w, fontSize: 30),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isMale ? b : l,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage("images/2.png"),
                                height: 80,
                                width: 80,
                              ),
                              Text(
                                "female",
                                style: TextStyle(color: w, fontSize: 30),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: l,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "height",
                        style: TextStyle(color: b, fontSize: 30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "${h.round()}",
                            style: TextStyle(
                                color: b,
                                fontSize: 40,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            "cm",
                            style: TextStyle(
                                color: w,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Slider(
                        value: h,
                        min: 1,
                        max: 220,
                        activeColor: b,
                        inactiveColor: Colors.black26,
                        onChanged: (value) {
                          setState(() {
                            h = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: l,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "weight",
                        style: TextStyle(color: b, fontSize: 30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            "${wi.round()}",
                            style: TextStyle(
                                color: b,
                                fontSize: 40,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            "kg",
                            style: TextStyle(
                                color: w,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Slider(
                        value: wi,
                        min: 10,
                        max: 220,
                        activeColor: b,
                        inactiveColor: Colors.black26,
                        onChanged: (value) {
                          setState(() {
                            wi = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: l,
                  ),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "calc",
                        style: TextStyle(
                            color: b,
                            fontSize: 40,
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(
                        h: h,
                        wi: wi,
                        isMale: isMale,
                        l: l,
                        b: b,
                        w: w,
                      ),
                    ),
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
