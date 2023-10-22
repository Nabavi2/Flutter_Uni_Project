import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_project/screens/AllTVShows.dart';
import 'package:uni_project/screens/FavoriteTVShows.dart';
import 'package:uni_project/screens/SearchScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    ;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: size.height * 0.075,
          backgroundColor: Color(0xff18162e),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              ),
              Tab(
                icon: Icon(Icons.search),
              )
            ],
            indicatorColor: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff18162e),
        body: TabBarView(children: [
          AllTVShows(),
          FavoriteTVShows(),
          SearchScreen(),
        ]),
      ),
    );
  }
}
