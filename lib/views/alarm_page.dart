import 'package:flutter/material.dart';
import 'package:uitraining/data.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Alarm",
          style: TextStyle(
              fontFamily: "avenir",
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 24),
        ),
        Expanded(
          child: ListView(
            children: alarms.map((alarm) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                // ignore: prefer_const_constructors
                //DECORANDO O BOX DO ALARM
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.purple, Colors.blue],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  // SOMBRA
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.4),
                      // borrão
                      blurRadius: 8,
                      //Space da parte de tras do box (a sombra)
                      spreadRadius: 4,
                      offset: Offset(4, 4),
                    )
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.label,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Office",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "avenir"),
                        ),
                        Switch(
                          value: true,
                          onChanged: (bool value) {},
                        ),
                      ],
                    ),
                    Text(
                      "Mon-Fri",
                      style:
                          TextStyle(color: Colors.white, fontFamily: "avenir"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "07:00 AM",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "avenir",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
