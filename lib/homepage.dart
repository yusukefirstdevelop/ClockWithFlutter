// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uitraining/clock_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Pegando a data de hoje
    var dateTime = DateTime.now();

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Container(
        alignment: Alignment.center,
        //CHAMANDO O RELOGIO CRIADO NO clock_view
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ignore: prefer_const_constructors
            Text(
              "Clock",
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Clock",
              style: TextStyle(color: Colors.white, fontSize: 64),
            ),
            const Text(
              "Clock",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const ClockView(),
            const Text(
              "Timezone",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                SizedBox(height: 16),
                Text(
                  "UTC",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
