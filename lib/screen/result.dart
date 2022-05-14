import 'package:flutter/material.dart';


class Result extends StatefulWidget {
  final Color? b;
  final Color? l;
  final Color ?w;
  final double ?wi;
  final double? h;
  final bool? isMale;

  Result({
    this.b,
    this.l,
    this.w,
    this.h,
    this.wi,
    this.isMale,
  });

  bool a1 = false;
  bool a2 = false;
  bool a3 = false;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    if ((widget.wi! / ((widget.h! * .01) * (widget.h! * .01))).round() < 18.5) {
      widget.a1 = true;
    }
    ;
    if ((widget.wi! / ((widget.h! * .01) * (widget.h! * .01))).round() > 18.5 &&
        (widget.wi! / ((widget.h! * .01) * (widget.h! * .01))).round() < 25) {
      widget.a2 = true;
    }
    ;
    if ((widget.wi! / ((widget.h! * .01) * (widget.h! * .01))).round() > 25) {
      widget.a3 = true;
    }
    ;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient:
                LinearGradient(colors: [widget.b!, widget.l!, widget.b!])),
          ),
          title: Text(
            "Result",
            style: TextStyle(color: widget.b, fontSize: 50),
          )),
      body: Container(
        color: widget.b,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your result: ",
                style: TextStyle(
                    color: widget.l, fontSize: 40, fontWeight: FontWeight.w900),
              ),
              Text(
                "${(widget.wi! / ((widget.h! * .01) * (widget.h !* .01))).round()}",
                style: TextStyle(
                    color: widget.l, fontSize: 40, fontWeight: FontWeight.w900),
              ),
              Text(
                widget.a1 ? "نحيف" : "", style: TextStyle(
                  color: widget.l,
                  fontSize: 40,
                  fontWeight: FontWeight.w900),
              ),
              Text(
                widget.a2 ? "وزنك طبيعي" : "", style: TextStyle(
                  color: widget.l,
                  fontSize: 40,
                  fontWeight: FontWeight.w900),
              ),
              Text(
                widget.a3 ? "وزنك زائد" : "", style: TextStyle(
                  color: widget.l,
                  fontSize: 40,
                  fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
