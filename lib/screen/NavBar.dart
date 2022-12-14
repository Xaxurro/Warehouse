import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Oflutter.com'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.all_inbox_rounded),
            title: Text('Inventory'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.align_vertical_bottom_rounded),
            title: Text('Sell Stats'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text('Log Out'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
