import 'package:daryo_ui/drawer/drawer_body.dart';
import 'package:flutter/material.dart';

import 'drawer_header.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          MyDrawerHeader(),
          MyDrawerBody(),
        ],
      ),
    );
  }
}
