import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/pages/home_page.dart';


class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => Home(),
        ),
      );
    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 181, 226),
      body: Content(),
    );
  }
  Widget Content(){
      return Center(
        child: Container(
          child: Lottie.network('https://lottie.host/da8aceb3-71aa-44a1-b6ca-601fd6f501de/6wG2ripg1T.json') ,
          ),
      );
    }
}