import 'package:flutter/material.dart';
import 'package:forrira/providers/auth.dart';
import 'package:forrira/screens/auth_screen.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  void logoutLogic(BuildContext ctx) {
    Provider.of<Auth>(ctx, listen: false).logout();
    //  Navigator.of(ctx).pushReplacementNamed(AuthScreen.routeName);
    // Navigator.pushReplacementNamed(ctx, '/');
    Navigator.pushNamedAndRemoveUntil(ctx, AuthScreen.routeName, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
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
              logoutLogic(context);
            },
          ),
        ],
      ),
    );
  }
}
