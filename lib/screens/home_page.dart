import 'package:daryo_ui/drawer/drawer.dart';
import 'package:daryo_ui/screens/latest_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Daryo", style: TextStyle(fontSize: 20.0)),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(child: Text("SO'NGI YANGILIKLAR")),
                Tab(child: Text("ASOSIY YANGILIKLAR")),
                Tab(child: Text("ENG KO'P")),
              ],
            ),
          ),
          drawer: MyDrawer(),
          body: TabBarView(
            children: [
              LatestPage(),
              Container(),
              Container()
            ],
          ),
        )
    );
  }
}
