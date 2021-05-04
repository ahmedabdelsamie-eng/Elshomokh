import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forrira/screens/dept_contents_screen.dart';

class DeptItem extends StatefulWidget {
  final String id;
  final String title;
  final String url;
  final Color color;
  DeptItem(this.id, this.title, this.color, this.url);

  @override
  _DeptItemState createState() => _DeptItemState();
}

class _DeptItemState extends State<DeptItem>
    with SingleTickerProviderStateMixin {
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(DeptContentsScreen.routeName,
        arguments: {'id': widget.id, 'title': widget.title});
  }

  // AnimationController _controller;
  // Animation<Offset> _slideAnimation;
  // @override
  // void initState() {
  //   super.initState();
  //   _controller =
  //       AnimationController(vsync: this, duration: Duration(milliseconds: 300))
  //         ..repeat(reverse: true);
  //   _slideAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(1.5, 0.0))
  //       .animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));
  //   _controller.forward();
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectCategory(context),
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Card(
          elevation: 10,
          shadowColor: Colors.amber,
          child:
              // SlideTransition(
              //   position: _slideAnimation,
              //   child:
              Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 100,
            // margin: EdgeInsets.all(5),

            padding: const EdgeInsets.all(10),
            // ignore: deprecated_member_use
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: FittedBox(
                    child: Text(
                      widget.title,
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  bottom: 25,
                  child: CircleAvatar(
                    radius: 27,
                    backgroundImage: AssetImage(widget.url),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
