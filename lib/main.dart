import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_project/providers/PTVShows.dart';
import 'package:uni_project/screens/MainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => PTVShows(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(background: Color(0xff100e2a)),
        ),
        home: MainScreen(),
      ),
    );
  }
}
