import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Dashboard'),
      backgroundColor: Colors.white,
      actions: [
        Icon(Icons.headphones),
        SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Icon(Icons.notification_add_sharp),
        ),
      ],
      elevation: 0,
    );
  }





  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
