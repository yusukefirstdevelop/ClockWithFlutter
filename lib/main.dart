import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uitraining/enums.dart';
import 'package:uitraining/menu_info.dart';
import 'package:uitraining/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<MenuInfo>(
          create: (context) => MenuInfo(
                MenuType.clock,
              ),
          child: HomePage()),
    );
  }
}
