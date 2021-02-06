import 'package:flutter/material.dart';

import '../../model/utils.dart';

class AppDrawer extends StatelessWidget {
  static const ROUTE_NAME = '/news-detail';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: <Widget>[
                AppBar(
                  title: Text(Utils.drawerHeaderText),
                  automaticallyImplyLeading: false,
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.ballot),
                  title: Text('Home Screen'),
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.class_),
                  title: Text('Read Later'),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.filter_list),
                  title: Text('Filters'),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 25),
            child: FlatButton.icon(
              onPressed: () {},
              icon: Icon(Icons.logout),
              label: Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }
}
