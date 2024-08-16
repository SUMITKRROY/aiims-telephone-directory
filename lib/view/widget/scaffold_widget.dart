import 'package:aiims_telephone_directory/component/appbar.dart';
import 'package:aiims_telephone_directory/component/bgimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../route/pageroute.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final bool? showLogin;
  final bool? showDrawer;

  const MyScaffold({super.key, required this.body, this.showLogin = false, this.showDrawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 80.h,
        backgroundColor: Colors.white,
        title: CustomAppBar(),
        actions: [
          showLogin == true
              ? ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, RoutePath.login);
                    //MyRoutes.navigateToSettingsScreen(context);
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ))
              : SizedBox.shrink()
        ],
      ),

      drawer:
      showDrawer == true
      ?Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MyHomePage()),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SettingsPage()),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => ContactUsPage()),
                // );
              },
            ),
          ],
        ),
      )
      :null,
      body: CustomImageContainer(
        child: body,
      ),
    );
  }
}
