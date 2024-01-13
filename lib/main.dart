import 'package:flutter/material.dart';
import 'package:todo/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {

  await Hive.initFlutter();
  var box = await Hive.openBox('mybox');
  runApp(const TODO());
}

class TODO extends StatelessWidget {
  const TODO({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(primarySwatch: Colors.purple),
    );
  }
}

