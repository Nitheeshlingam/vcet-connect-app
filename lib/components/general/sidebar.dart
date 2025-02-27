import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vcet_connect/routes/route_names.dart';

class SidebarDrawer extends StatelessWidget {
  const SidebarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    String currentRoute = GoRouterState.of(context).uri.toString();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  foregroundImage: AssetImage('assets/images/vcet_logo.jpg'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 10),
                Text(
                  'V-Connect',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            selected: currentRoute == RouteNames.home,
            selectedTileColor: Colors.blue.withOpacity(0.1),
            leading: Icon(Icons.home,
                color: currentRoute == RouteNames.home
                    ? Colors.blue
                    : Colors.grey),
            title: Text(
              'Home',
              style: TextStyle(
                color: currentRoute == RouteNames.home
                    ? Colors.blue
                    : Colors.black,
                fontWeight: currentRoute == RouteNames.home
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            onTap: () {
              context.go(RouteNames.home);
              Navigator.pop(context);
            },
          ),
          ListTile(
            selected: currentRoute == RouteNames.wardDetails,
            selectedTileColor: Colors.blue.withOpacity(0.1),
            leading: Icon(Icons.book,
                color: currentRoute == RouteNames.wardDetails
                    ? Colors.blue
                    : Colors.grey),
            title: Text(
              'Wards Detail',
              style: TextStyle(
                color: currentRoute == RouteNames.wardDetails
                    ? Colors.blue
                    : Colors.black,
                fontWeight: currentRoute == RouteNames.wardDetails
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            onTap: () {
              context.go(RouteNames.wardDetails);
              Navigator.pop(context);
            },
          ),
          ListTile(
            selected: currentRoute == RouteNames.signIn,
            selectedTileColor: Colors.blue.withOpacity(0.1),
            leading: Icon(Icons.person,
                color: currentRoute == RouteNames.signIn
                    ? Colors.blue
                    : Colors.grey),
            title: Text(
              'Sign in',
              style: TextStyle(
                color: currentRoute == RouteNames.signIn
                    ? Colors.blue
                    : Colors.black,
                fontWeight: currentRoute == RouteNames.signIn
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            onTap: () {
              context.go(RouteNames.signIn);
              Navigator.pop(context);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
