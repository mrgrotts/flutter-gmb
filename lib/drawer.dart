import 'package:flutter/material.dart';
import 'home.dart';
import 'posts.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class StatefulDrawer extends StatefulWidget {
  @override
  DrawerState createState() => DrawerState();
}

class DrawerState extends State<StatefulDrawer> {
  String activeScreen = 'Home';

  getScreen(String title) {
    switch (title) {
      case 'Home':
        {
          return new Home();
        }
      case 'Posts':
        {
          return new Posts();
        }
      default:
        {
          return new Text('Error Loading Screens NERDDD');
        }
    }
  }

  select(String title) {
    setState(() => activeScreen = title);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final drawerItems = [
      new DrawerItem('Home', Icons.folder),
      new DrawerItem('Posts', Icons.folder),
      new DrawerItem('Insights', Icons.show_chart),
      new DrawerItem('Listings', Icons.view_list),
      new DrawerItem('Settings', Icons.settings)
    ];

    var drawerWidget = <Widget>[
      UserAccountsDrawerHeader(
        accountName: Text('GMB Boi 3000'),
        accountEmail: Text('lol@lol.com'),
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://i.pinimg.com/564x/00/96/e8/0096e8a5f4f65c68e8305c5f01bf2d13.jpg'),
        ),
        onDetailsPressed: () {},
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      )
    ];

    for (var i = 0; i < drawerItems.length; i++) {
      var item = drawerItems[i];

      drawerWidget.add(new ListTile(
        enabled: true,
        leading: Icon(item.icon),
        selected: activeScreen == item.title,
        title: Text(item.title),
        onTap: () {
          // Update app state
          select(item.title);
          // Navigator.pop(context);
        },
      ));
    }

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: drawerWidget,
        ),
      ),
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: Center(
        child: getScreen(activeScreen),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('GMB Boi 3000'),
              accountEmail: Text('lol@lol.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/564x/00/96/e8/0096e8a5f4f65c68e8305c5f01bf2d13.jpg'),
              ),
              onDetailsPressed: () {},
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              enabled: true,
              leading: Icon(Icons.folder),
              selected: true,
              title: Text('Home'),
              onTap: () {
                // Update app state
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Posts'),
              onTap: () {
                // Update app state
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.show_chart),
              title: Text('Insights'),
              onTap: () {
                // Update app state
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('Listings'),
              onTap: () {
                // Update app state
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Update app state
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Welcome to Flutter'),
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
