import 'package:flutter/material.dart';

class TryAnimation extends StatefulWidget {
  @override
  _TryAnimationState createState() => _TryAnimationState();
}

class _TryAnimationState extends State<TryAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Size> _heightanimation;

  var _two = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _heightanimation = Tween<Size>(
            begin: Size(double.infinity, 210), end: Size(double.infinity, 230))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _heightanimation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation '),
      ),
      body: Card(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          height: _heightanimation.value.height,
          width: MediaQuery.of(context).size.width * .9,
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'name'),
                ),
                if (_two)
                  TextFormField(
                    decoration: InputDecoration(labelText: 'password'),
                  ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (!_two) {
                        setState(() {
                          _two = true;
                        });
                        _controller.forward();
                      } else {
                        setState(() {
                          _two = false;
                        });
                        _controller.reverse();
                      }
                    },
                    child: Text('Try Animation'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
