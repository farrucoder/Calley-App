import 'package:flutter/material.dart';
import 'package:fluttermachinetest/Utils/User-Preference-Data.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
   String? name;
   String? email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    name = await UserPreferencesData.getName();
    email = await UserPreferencesData.getEmail();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Row(
              children: [
                Icon(Icons.person, size: 65, color: Colors.white),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          name ?? 'User',
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.orangeAccent,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Personal',
                          style: TextStyle(
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      email ?? 'user@gmail.com',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.rocket_launch),
            title: Text('Getting Started'),
          ),
          ListTile(leading: Icon(Icons.cloud_circle), title: Text('Sync Data')),

          ListTile(leading: Icon(Icons.add_call), title: Text('Send Logs')),
          ListTile(leading: Icon(Icons.settings), title: Text('Settings')),
        ],
      ),
    );
  }
}
