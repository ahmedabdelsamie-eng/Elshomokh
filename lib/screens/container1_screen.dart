import 'dart:math';

import 'package:animated_button/animated_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forrira/models/http_exception.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Container1Screen extends StatelessWidget {
  static const routeName = '/contain1';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      //backgroundColor: Colors.teal,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  // Color.fromRGBO(255, 215, 0, 1).withOpacity(0.5),
                  Colors.teal,
                  Color.fromRGBO(75, 100, 117, 1).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          // import this Package in pubspec.yaml file
// dependencies:
//
//   particles_flutter: ^0.1.2
          // CircularParticle(
          //   width: w,
          //   height: h,
          //   particleColor: Colors.amber,
          //   awayAnimationDuration: Duration(milliseconds: 600),
          //   awayAnimationCurve: Curves.easeInOutBack,
          //   numberOfParticles: 150,
          //   speedOfParticles: 1.5,
          //   maxParticleSize: 7,
          //   awayRadius: w / 5,
          //   onTapAnimation: true,
          //   isRandSize: true,
          //   isRandomColor: false,
          //   connectDots: true,
          //   enableHover: true,
          //   hoverColor: Colors.black,
          //   hoverRadius: 90,
          // ),

          SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                height: deviceSize.height,
                width: deviceSize.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      flex: deviceSize.width > 600 ? 2 : 1,
                      child: AuthCard(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: IconButton(
                icon: Icon(Icons.keyboard_return),
                color: Colors.white,
                onPressed: () => Navigator.of(context).pop()),
          )
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();
  AnimationController _controller;
  Animation<Offset> _slideAnimation;
  Animation<double> _opacityAnimation;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    // _heightAnimation.addListener(() => setState(() {}));
    _slideAnimation = Tween<Offset>(begin: Offset(0, -1.5), end: Offset(0, 0))
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occured!'),
        content: Text(message),
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text('OKAy'),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    FocusScope.of(context).unfocus();
    setState(() {
      _isLoading = true;
    });
    _formKey.currentState.save();
    try {
      // await Provider.of<Auth>(context, listen: false)
      //     .login(_authData['email'], _authData['password']);
      // print('1111');

      // Navigator.pushReplacementNamed(context, HomeyScreen.routeName);
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (BuildContext context) => HomeyScreen()));
      // Navigator.pushNamedAndRemoveUntil(
      //     context, HomeyScreen.routeName, (_) => false);

      // await Provider.of<Auth>(context, listen: false)
      //     .signUP(_authData['email'], _authData['password']);
      // Navigator.of(context).pushReplacementNamed(HomeyScreen.routeName);
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'this email address is already in use';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'this is not a valid email address ';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'this password is to weak ';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'could not find a user with that email ';
      } else if (error.toString().contains('INVALID_PASSWORd')) {
        errorMessage = 'invalid password';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'Authentication could not,please try again later';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  var urli = 'https://www.facebook.com/profile.php?id=100006687551359';
  void _launchURL() async => await canLaunch(urli)
      ? await launch(urli)
      : throw 'Could not launch $urli';

  @override
  Widget build(BuildContext context) {
    // final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10.0,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.9,
        // height: _heightAnimation.value.height,
        padding: EdgeInsets.all(16.0),

        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  keyboardType: TextInputType.emailAddress,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                  },
                  onSaved: (value) {
                    _authData['email'] = value.trim();
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Mobile Number'),
                  obscureText: true,
                  controller: _passwordController,
                  // ignore: missing_return
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (value) {
                    _authData['password'] = value.trim();
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a description';
                    }
                    if (value.length < 10) {
                      return 'should be at least 10 characters long';
                    }

                    return null;
                  },
                  onSaved: (value) {},
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-Mail'),
                  obscureText: true,
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'Passwords do not match!';
                    }
                  },
                ),

                SizedBox(
                  height: 70,
                ),
                // IconButton(
                //     icon: Icon(
                //       FontAwesomeIcons.google,
                //       color: Theme.of(context).accentColor,
                //       size: 30,
                //     ),
                //     onPressed: null),
                AnimatedButton(
                  onPressed: _submit,
                  child: Text(
                    'SEND',
                    style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 2,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Colors.teal,
                  enabled: true,
                  shadowDegree: ShadowDegree.light,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 20,
                  child: Center(
                    child: Text(
                      '" or  using  social  media "',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.teal),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          icon: Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.blue,
                          ),
                          onPressed: _launchURL),
                      IconButton(
                          icon: Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.brown,
                          ),
                          onPressed: () {}),
                      IconButton(
                          icon: Icon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.green,
                          ),
                          onPressed: () {}),
                      IconButton(
                          icon: Icon(
                            FontAwesomeIcons.twitter,
                            color: Colors.blue,
                          ),
                          onPressed: () {})
                    ],
                  ),
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20),
                ),
                // ignore: deprecated_member_use

                // ignore: deprecated_member_use
              ],
            ),
          ),
        ),
      ),
    );
  }
}
