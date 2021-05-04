import 'package:flutter/material.dart';
import 'package:forrira/providers/auth.dart';
import 'package:forrira/screens/auth_screen.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authData = Provider.of<Auth>(context, listen: false);
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('FORERA'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              authData.logout(context);
              // Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
